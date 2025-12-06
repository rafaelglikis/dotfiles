-- General Settings
vim.opt.number = true
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.autoread = true
vim.opt.mouse = 'a'
vim.cmd('syntax on')

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- Easier indentation shortcuts
vim.keymap.set('v', '<Tab>', '>gv')
vim.keymap.set('v', '<S-Tab>', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- Line Wrapping
vim.opt.wrap = false
vim.opt.linebreak = true

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = false -- set nohlsearch overrides set hlsearch
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Window
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Others
vim.opt.hidden = true
vim.opt.scrolloff = 8

-- Map Leader
vim.g.mapleader = " "

-- Timeout
vim.opt.timeout = true
vim.opt.timeoutlen = 700
vim.opt.ttimeoutlen = 100

-- Paste last thing yanked, not deleted
vim.keymap.set('n', '<leader>p', '"0p')
vim.keymap.set('n', '<leader>P', '"0P')

vim.keymap.set('n', '<S-Tab>', '<<')
vim.keymap.set('i', '<S-Tab>', '<C-d>')

-- System Clipboard
vim.opt.clipboard = 'unnamedplus'

-- Relative Number Toggle on Insert
vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    command = "set norelativenumber"
})
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    command = "set relativenumber"
})

vim.keymap.set('', '<leader><leader>r', ':set relativenumber!<CR>')

-- Tmux splits (Standard Vim splits)
vim.keymap.set('n', '<leader>"', ':split <CR>')
vim.keymap.set('n', '<leader>%', ':vsplit <CR>')

-- Yank all
vim.keymap.set('n', '<leader>Y', 'ggyG')

-- Move lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Function commands
vim.keymap.set('n', 'yaf', 'va{Vo{y<CR>')
vim.keymap.set('n', 'caf', 'va{Vo{c<CR>')
vim.keymap.set('n', 'daf', 'va{Vo{d<CR>')

-- Source config
vim.keymap.set('n', '<Leader><CR>', ':luafile %<CR>')

-- Colorscheme settings (Basic)
vim.opt.termguicolors = true

-- Quickfix navigation
vim.keymap.set('n', '<C-j>', ':cnext<CR>')
vim.keymap.set('n', '<C-k>', ':cprev<CR>')
vim.keymap.set('n', '<C-E>', ':copen<CR>')

-- VSCode / Cursor / Antigravity extension detection
if vim.g.vscode then
    local function code_action(cmd)
        return function()
            if vim.fn.exists('*VSCodeNotify') == 1 then
                vim.fn.VSCodeNotify(cmd)
            else
                vim.notify("VSCodeNotify not available for command: " .. cmd, vim.log.levels.ERROR)
            end
        end
    end

    -- Window Management
    vim.keymap.set('n', '<leader>jw', code_action('workbench.action.toggleWordWrap'))
    vim.keymap.set('n', '<leader>jf', code_action('workbench.action.maximizeEditor'))
    vim.keymap.set('n', '<leader>jF', code_action('workbench.action.toggleZenMode'))

    -- Tabs
    vim.keymap.set('n', '<A-.>', code_action('workbench.action.nextEditor'))
    vim.keymap.set('n', '<A-,>', code_action('workbench.action.previousEditor'))

    -- Splits Navigation
    vim.keymap.set('n', '<A-J>', code_action('workbench.action.navigateDown'))
    vim.keymap.set('n', '<A-K>', code_action('workbench.action.navigateUp'))
    vim.keymap.set('n', '<A-L>', code_action('workbench.action.navigateRight'))
    vim.keymap.set('n', '<A-H>', code_action('workbench.action.navigateLeft'))

    -- Git
    vim.keymap.set('n', '<leader>gb', code_action('git.checkout'))
    vim.keymap.set('n', '<leader>gd', code_action('git.openChange'))
    vim.keymap.set('n', '<leader>gp', code_action('git.pull'))
    vim.keymap.set('n', '<leader>gP', code_action('git.push'))

    -- Tools
    vim.keymap.set('n', '<leader>n', code_action('editor.action.rename'))
    vim.keymap.set('n', '<leader>;', code_action('workbench.action.terminal.toggleTerminal'))
    vim.keymap.set('n', '<leader>:', code_action('workbench.action.showCommands'))
    vim.keymap.set('n', '<leader>a', code_action('workbench.action.showCommands'))

    -- Code Navigation
    vim.keymap.set('n', '<leader>b', code_action('editor.action.revealDefinition'))
    vim.keymap.set('n', '<leader>u', code_action('editor.action.referenceSearch.trigger'))
    vim.keymap.set('n', '<leader>I', code_action('editor.action.goToImplementation'))
    vim.keymap.set('n', '<leader>e', code_action('workbench.action.quickOpen'))
    vim.keymap.set('n', '<leader>/', code_action('actions.find'))
    vim.keymap.set('n', '<leader>F', code_action('workbench.action.findInFiles'))
    vim.keymap.set('n', '<leader>R', code_action('workbench.action.replaceInFiles'))

    -- Refactoring
    vim.keymap.set('n', '<leader>=', code_action('editor.action.formatDocument'))
    vim.keymap.set('n', '<leader>r', code_action('editor.action.rename'))
    vim.keymap.set('n', '<leader>o', code_action('editor.action.organizeImports'))

    -- Debug
    vim.keymap.set('n', '<leader>d', code_action('workbench.action.debug.start'))
    vim.keymap.set('n', '<leader>B', code_action('editor.debug.action.toggleBreakpoint'))
    vim.keymap.set('n', '<leader>.', code_action('editor.debug.action.runToCursor'))
    vim.keymap.set('n', '<leader>,', code_action('workbench.action.debug.stepOver'))
    vim.keymap.set('n', '<leader>>', code_action('workbench.action.debug.stepInto'))
    vim.keymap.set('n', '<leader><', code_action('workbench.action.debug.stepOut'))
    vim.keymap.set('n', '<leader><leader>>', code_action('workbench.action.debug.continue'))
    vim.keymap.set('n', '<leader><leader><', code_action('workbench.action.debug.stop'))

    -- Cursor IDE Specifics
    vim.keymap.set('n', '<leader>jc', code_action('aichat.newchataction'))           -- Cursor AI Chat
    vim.keymap.set('v', '<leader>jc', code_action('aichat.newchataction'))
    vim.keymap.set('n', '<leader>jC', code_action('aichat.insertselectionintochat')) -- Add to Chat
    vim.keymap.set('n', '<leader>I', code_action('composer.open'))                   -- Composer
end
