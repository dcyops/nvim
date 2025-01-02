-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load Plugins
require("lazy").setup("plugins")

-- Load Appearance Settings
require("config.appearance")

-- Load LSP Configurations
require("config.lsp")

-- Basic settings
vim.opt.compatible = false
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.wildmode = "longest,list"
vim.opt.colorcolumn = "100"
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.ttyfast = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.scrolloff = 999

-- Disable netrw (for nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable syntax highlighting and filetype detection
vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

-- Keybindings
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })
vim.keymap.set("n", "<C-e>", "$", { silent = true })
vim.keymap.set("n", "<C-a>", "0", { silent = true })
vim.keymap.set("n", "<C-f>", "b", { silent = true })
vim.keymap.set("n", "<C-j>", "w", { silent = true })
vim.keymap.set("i", "<C-e>", "<ESC>$a", { silent = true })
vim.keymap.set("i", "<C-a>", "<ESC>0i", { silent = true })
vim.keymap.set("i", "<C-f>", "<ESC>bi", { silent = true })
vim.keymap.set("i", "<C-j>", "<ESC>wi", { silent = true })
vim.keymap.set("n", "<leader>s", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>,", "<Cmd>BufferPrevious<CR>", { silent = true })
vim.keymap.set("n", "<leader>.", "<Cmd>BufferNext<CR>", { silent = true })
vim.keymap.set("n", "<leader>x", "<Cmd>BufferClose<CR>", { silent = true })

vim.keymap.set("n", "d", '"_d', { noremap = true, silent = true })
vim.keymap.set("x", "d", '"_d', { noremap = true, silent = true })
vim.keymap.set("x", "p", '"_dP', { noremap = true, silent = true })
