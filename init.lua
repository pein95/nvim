require("keymaps")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.g.mapleader = " "


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
local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
     dependencies = { 'nvim-lua/plenary.nvim' }
  },
  

  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
    require("nvim-tree").setup {}
    end,
  }

    
}
local opts = {}
require("lazy").setup(plugins, opts)

local builtin = require("telescope.builtin")

local treesitterConfig = require("nvim-treesitter.configs")
treesitterConfig.setup({
  ensure_installed = {"bash", "python", "kotlin", "yaml", "xml", "lua"},
  highlight = {enable = true},
  indent = { enable = true },


})

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"
