#!/usr/bin/env bash
# Claude Code status line (two lines).
# L1 (model/session): model | reasoning | fast-mode | rate limits | context left
# L2 (workspace):     repo/dir (clickable) | branch +staged ~modified | PR | cost
# Receives session JSON on stdin (see code.claude.com/docs/en/statusline).
input=$(cat)

# One jq pass -> one field per line, read into an array. mapfile preserves
# empty lines as empty elements, so absent fields don't shift the rest.
mapfile -t F < <(printf '%s' "$input" | jq -r '
  .model.display_name // "?",
  (.context_window.remaining_percentage // ""),
  (.effort.level // ""),
  (.fast_mode // false),
  (.cost.total_cost_usd // 0),
  (.cost.total_lines_added // 0),
  (.cost.total_lines_removed // 0),
  (.rate_limits.five_hour.used_percentage // ""),
  (.rate_limits.seven_day.used_percentage // ""),
  (.pr.number // ""),
  (.pr.review_state // ""),
  (.workspace.current_dir // .cwd // ""),
  (.workspace.repo.host // ""),
  (.workspace.repo.owner // ""),
  (.workspace.repo.name // "")')

MODEL=${F[0]}; LEFT=${F[1]}; EFFORT=${F[2]}; FAST=${F[3]}
COST=${F[4]}; ADDED=${F[5]}; REMOVED=${F[6]}; RL5=${F[7]}; RL7=${F[8]}
PR_NUM=${F[9]}; PR_STATE=${F[10]}; DIR=${F[11]}
R_HOST=${F[12]}; R_OWNER=${F[13]}; R_NAME=${F[14]}

CYAN='\033[36m'; GREEN='\033[32m'; YELLOW='\033[33m'; RED='\033[31m'
BLUE='\033[34m'; MAGENTA='\033[35m'; DIM='\033[2m'; BOLD='\033[1m'; RESET='\033[0m'
SEP=" ${DIM}|${RESET} "

# --- Line 1: model / session ------------------------------------------------
EFFORT_SEG=""; [ -n "$EFFORT" ] && EFFORT_SEG=" ${MAGENTA}⚡${EFFORT}${RESET}"
FAST_SEG="";   [ "$FAST" = "true" ] && FAST_SEG=" ${BLUE}🚀 fast${RESET}"

# Rate limits (Pro/Max only; hidden when absent).
RL_SEG=""
if [ -n "$RL5" ] || [ -n "$RL7" ]; then
  RL_SEG="${SEP}"
  [ -n "$RL5" ] && RL_SEG="$RL_SEG$(printf '5h %.0f%%' "$RL5")"
  [ -n "$RL5" ] && [ -n "$RL7" ] && RL_SEG="$RL_SEG ${DIM}·${RESET} "
  [ -n "$RL7" ] && RL_SEG="$RL_SEG$(printf '7d %.0f%%' "$RL7")"
fi

# Context-left bar (color by how much headroom remains).
CTX_SEG=""
if [ -n "$LEFT" ]; then
  L=${LEFT%%.*}
  if   [ "$L" -le 15 ]; then C="$RED"
  elif [ "$L" -le 35 ]; then C="$YELLOW"
  else C="$GREEN"; fi
  FILLED=$((L / 10)); [ "$FILLED" -gt 10 ] && FILLED=10; EMPTY=$((10 - FILLED))
  printf -v FB "%${FILLED}s"; printf -v EB "%${EMPTY}s"
  BAR="${FB// /█}${EB// /░}"
  CTX_SEG="${SEP}${C}🧠 ${BAR} ${L}% left${RESET}"
fi

LINE1="${CYAN}${BOLD}[$MODEL]${RESET}${EFFORT_SEG}${FAST_SEG}${RL_SEG}${CTX_SEG}"

# --- Line 2: workspace ------------------------------------------------------
DIRNAME="${DIR##*/}"
# Clickable repo link (OSC 8) when repo identity is known; else plain dir name.
if [ -n "$R_HOST" ] && [ -n "$R_OWNER" ] && [ -n "$R_NAME" ]; then
  URL="https://$R_HOST/$R_OWNER/$R_NAME"
  LOC="\033]8;;${URL}\a${DIRNAME}\033]8;;\a"
else
  LOC="$DIRNAME"
fi

# Git branch + dirty counts (guarded to a work tree).
GIT_SEG=""
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  BRANCH=$(git branch --show-current 2>/dev/null)
  STAGED=$(git diff --cached --numstat 2>/dev/null | wc -l | tr -d ' ')
  MODIFIED=$(git diff --numstat 2>/dev/null | wc -l | tr -d ' ')
  if [ -n "$BRANCH" ]; then
    GIT_SEG="${SEP}🌿 $BRANCH"
    [ "$STAGED" -gt 0 ] && GIT_SEG="$GIT_SEG ${GREEN}+${STAGED}${RESET}"
    [ "$MODIFIED" -gt 0 ] && GIT_SEG="$GIT_SEG ${YELLOW}~${MODIFIED}${RESET}"
  fi
fi

# PR segment.
PR_SEG=""
if [ -n "$PR_NUM" ]; then
  case "$PR_STATE" in
    approved)          PR_SEG="${SEP}${GREEN}PR #${PR_NUM} ✓${RESET}" ;;
    changes_requested) PR_SEG="${SEP}${RED}PR #${PR_NUM} ✗${RESET}" ;;
    pending)           PR_SEG="${SEP}${YELLOW}PR #${PR_NUM} ⏳${RESET}" ;;
    draft)             PR_SEG="${SEP}${DIM}PR #${PR_NUM} draft${RESET}" ;;
    *)                 PR_SEG="${SEP}PR #${PR_NUM}" ;;
  esac
fi

# Cost + session line delta.
COST_FMT=$(printf '$%.2f' "$COST" 2>/dev/null || printf '$0.00')
COST_SEG="${SEP}💰 ${COST_FMT}"
{ [ "$ADDED" != "0" ] || [ "$REMOVED" != "0" ]; } && \
  COST_SEG="$COST_SEG ${GREEN}+${ADDED}${RESET} ${RED}-${REMOVED}${RESET}"

LINE2="📁 ${LOC}${GIT_SEG}${PR_SEG}${COST_SEG}"

printf '%b\n' "$LINE1"
printf '%b\n' "$LINE2"