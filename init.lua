local vim = vim
local Plug = vim.fn['plug#']

-- disable netrw nvim plugin as recommended by nvim-tree plugin
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

vim.call('plug#begin')
  Plug('tanvirtin/monokai.nvim')

  -- change the default behavior of yank on deleting
  Plug('tpope/vim-repeat')
  Plug('svermeulen/vim-easyclip')

  -- Fancy icons
  Plug('nvim-tree/nvim-web-devicons')
  Plug('nvim-tree/nvim-tree.lua')

  -- telescope (file finder)
  Plug('nvim-lua/plenary.nvim')
  Plug('nvim-telescope/telescope.nvim', { tag = '0.1.6' })
  Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate'})

  -- Tpope's magic
  Plug('tpope/vim-sensible')
  Plug('tpope/vim-endwise')
  Plug('tpope/vim-surround')
  Plug('tpope/vim-commentary')
  Plug('tpope/vim-rails')

  Plug('kdheepak/lazygit.nvim')

  Plug('nvim-lualine/lualine.nvim')

  Plug('markstory/vim-zoomwin')
  Plug('windwp/nvim-autopairs')
  Plug('zbirenbaum/copilot.lua')
  Plug('iamcco/markdown-preview.nvim', { ['do'] = 'cd app && npx --yes yarn install' })

vim.call('plug#end')

-- remap leader to <Space>
vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

-- General settings
vim.opt.encoding = "utf-8"
vim.opt.ruler = true
vim.opt.showcmd = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.clipboard = "unnamed"
vim.opt.termguicolors = true

-- display extra whitespaces as dots
vim.cmd("set list listchars=tab:»·,trail:·,nbsp:␣")

-- Drawn a line at 100 character mark
vim.opt.textwidth = 100
vim.opt.colorcolumn = "100"

-- Display numbers and relative numbers
vim.wo.number = true
vim.wo.numberwidth = 5
vim.wo.rnu = true

-- Open new split panes to right and bottom, which feels more natural
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Highlight the current line
vim.opt.cursorline = true

-- Folding using identation
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel =  10

-- Handy save & quit shortcuts with <Leader> + s and <Leader> + q
vim.keymap.set({"n", "v", "i"}, "<Leader>s", ":w<CR>", { silent = true, remap = false })
vim.keymap.set({"n", "v", "i"}, "<Leader>q", ":q<CR>", { silent = true, remap = false })

-- Open a vsplit with <Leader>+t
vim.keymap.set("n", "<Leader>t", ":vsp<CR>", { silent = true, remap = false })

-- Move a line down with option + j
vim.keymap.set("n", "∆", ":m .+1<CR>==", { silent = true, remap = false })
vim.keymap.set("i", "∆", "<Esc>:m .+1<CR>==gi", { silent = true, remap = false })

-- Move a line down with option + k
vim.keymap.set("n", "˚", ":m .-2<CR>==", { silent = true, remap = false })
vim.keymap.set("i", "˚", "<Esc>:m .-2<CR>==gi", { silent = true, remap = false })

-- use Ctrl + hjkl to move between windows
vim.keymap.set({"n", "v", "i"}, "<C-j>", "<C-w>j", { silent = true, remap = false })
vim.keymap.set({"n", "v", "i"}, "<C-k>", "<C-w>k", { silent = true, remap = false })
vim.keymap.set({"n", "v", "i"}, "<C-h>", "<C-w>h", { silent = true, remap = false })
vim.keymap.set({"n", "v", "i"}, "<C-l>", "<C-w>l", { silent = true, remap = false })

-------- START: plugins config:

-- Theme
require('monokai').setup { palette = require('monokai').soda }

-- nvim-tree
require("nvim-tree").setup({
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})

-- Find current file in tree with <Leader>+n
vim.keymap.set("n", "<Leader>n", ":NvimTreeFindFile<CR>", { silent = true, remap = false })

-- Telescope shortcuts:
local builtin = require('telescope.builtin')
--- Find files with <Leader>+y
vim.keymap.set('n', '<Leader>y', builtin.find_files, {})
--- Live grep with <Leader>+f
vim.keymap.set('n', '<Leader>f', builtin.live_grep, {})
--- " to open registers 
vim.keymap.set('n', '"', builtin.registers, {})

-- Open lazygit with <Leader>gg
vim.keymap.set({"i", "n"}, "<Leader>gg", ":LazyGit<CR>", { silent = true, remap = false })

-- Status line
require('lualine').setup()

require("copilot").setup({
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = "<TAB>",
      reject = "<ESC>",
    }
  }
})

require("nvim-autopairs").setup()
