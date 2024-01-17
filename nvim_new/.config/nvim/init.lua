--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('plugins')

-- Plugin configs
require('neodev').setup()
require('plugins.harpoon')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.which-key')
require('plugins.nvim-cmp')

-- Set highlight on search
vim.o.hlsearch = true
-- Make line numbers default
vim.wo.number = true
-- Enable mouse mode
vim.o.mouse = 'a'
-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'
-- Enable break indent
vim.o.breakindent = true
-- Save undo history
vim.o.undofile = true
-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'
-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true
vim.o.ruler = true
vim.o.showcmd = true
vim.o.incsearch = true
vim.o.autowrite = true
vim.o.modelines = 0
vim.o.nomodeline = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.shiftround = true
vim.o.expandtab = true
vim.o.relativenumber = true
vim.o.number = true
vim.o.spell = true
vim.o.title = true
vim.o.list = true
vim.o.wildmode = "longest:full,full"
vim.o.listchars = "tab:▸ ,trail:·"
vim.o.nojoinspaces = true
vim.o.splitright = true
vim.o.confirm = true
vim.o.exrc = true

-- Github Copliot settings
vim.g.copilot_no_tab_map = true;
vim.keymap.set('i', "<C-J>", 'copilot#Accept()', { expr = true, replace_keycodes = true })
vim.keymap.set(
  "i",
  "<Plug>(vimrc:copilot-dummy-map)",
  'copilot#Accept("")',
  { silent = true, expr = true, desc = "Copilot dummy accept" }
)

-- [[ Basic Keymaps ]]
vim.keymap.set('n', '<leader>k', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>x', ':!xdg-open %<cr><cr>')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'J', 'mzJ`z')

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Auto-create parent directories (except for URIs "://").
vim.cmd [[
  augroup ExpandWrite
    autocmd!
    autocmd BufWritePre,FileWritePre * if @% !~# '\(://\)' | call mkdir(expand('<afile>:p:h'), 'p') | endif
  augroup end
]]

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
