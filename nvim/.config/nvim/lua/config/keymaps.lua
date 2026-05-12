-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Tmux-style splits
vim.keymap.set("n", '<leader>"', ":split<CR>", { desc = "Split window below" })
vim.keymap.set("n", "<leader>%", ":vsplit<CR>", { desc = "Split window right" })

-- Remove LazyVim default split bindings
pcall(vim.keymap.del, "n", "<leader>-")
pcall(vim.keymap.del, "n", "<leader>|")

-- Diff (git hunk) navigation
local function next_hunk() require("gitsigns").nav_hunk("next") end
local function prev_hunk() require("gitsigns").nav_hunk("prev") end
vim.keymap.set("n", "]d", next_hunk, { desc = "Next diff" })
vim.keymap.set("n", "[d", prev_hunk, { desc = "Previous diff" })
vim.keymap.set("n", "]c", next_hunk, { desc = "Next diff" })
vim.keymap.set("n", "[c", prev_hunk, { desc = "Previous diff" })

-- Diagnostic navigation
vim.keymap.set("n", "]e", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Next diagnostic" })
vim.keymap.set("n", "[e", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Previous diagnostic" })

-- Revert git hunk
vim.keymap.set("n", "<leader>gr", function() require("gitsigns").reset_hunk() end, { desc = "Revert git hunk" })

-- Reload config
vim.keymap.set("n", "<leader><CR>", ":source $MYVIMRC<CR>", { desc = "Reload config" })

-- Toggle file explorer
vim.keymap.set("n", "<M-1>", function() Snacks.explorer() end, { desc = "Toggle file explorer" })
