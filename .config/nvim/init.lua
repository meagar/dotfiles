-- Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local ops = {}

require("lazy").setup("plugins")

vim.cmd("set smartcase")
vim.cmd("set relativenumber")

-- Soft tabs
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Higlight the 80th column
vim.cmd("set colorcolumn=80")
vim.cmd("highlight ColorColumn guibg=#191923")

-- Code folding based on indentation
--vim.cmd("set foldmethod=indent")

