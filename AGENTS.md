# AGENTS.md

## Repo Shape
- This is a personal dotfiles repo; `setup.sh` is the deployment source of truth, not GNU Stow.
- Deployment maps `topdir/path` to `~/path` by stripping the first directory segment, e.g. `cli/.gitconfig` -> `~/.gitconfig` and `ai/.config/opencode/opencode.json` -> `~/.config/opencode/opencode.json`.
- Only directories listed in `setup.sh`'s `dotfiles` array are deployed. Add new top-level config directories there or they will be ignored.
- `setup.sh` links every regular file or symlink under those directories, creates parent directories, and uses `ln -s --force`; do not run it as a harmless check against a user's live home directory.

## Commands
- `bash setup.sh`: relink configured dotfiles into `$HOME`.
- `make install`: full machine bootstrap; runs setup, installs apt packages, clones Vundle/Oh My Zsh plugins, and runs Vim plugin install. Use only when asked for installation/bootstrap.
- Focused checks:
- `bash -n setup.sh`: check setup script syntax without running it.
- `python -m json.tool <file>`: validate JSON configs.
- `stylua --check cli/.config/nvim/lua`: check Neovim Lua formatting when `stylua` is installed.

## Editing Notes
- Shell aliases/functions are split across `cli/.bashrc` and `cli/.zshrc`; check both when changing shared shell behavior.
- Classic Vim config is separate at `cli/.vimrc` and uses Vundle; do not confuse it with the LazyVim Neovim setup under `cli/.config/nvim`.
- For Neovim, edit `cli/.config/nvim` for the active LazyVim/lazy.nvim setup.
- `cli/.config/nvim/init.lua` only bootstraps `lua/config/lazy.lua`; custom Lazy specs live under `cli/.config/nvim/lua/plugins`, with plugin pins in `lazy-lock.json`.
- Shell aliases may depend on host tools such as `fzf`, `xclip`, `kubectl`, `kubens`, `kubectx`, `docker compose`, and `lazydocker`; verify availability before relying on them in scripts.
- Repo-local OpenCode config is stored under `ai/.config/opencode` and deploys to `~/.config/opencode`; after changing OpenCode config, agents, or instructions, the running OpenCode session must be restarted.
- Existing shared guidance in `CLAUDE.md` is broad prose; prefer the executable sources above when it conflicts with scripts or config.
