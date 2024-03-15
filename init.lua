vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
  { "shaunsingh/nord.nvim" },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { 
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs") 

      configs.setup({
        ensure_installed = { "lua", "java", "javascript", "kotlin", "html" },
        sync_install = false,
        highlight = { enable = true },
        ident = { enable = true },
      })
    end

  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  },
}
local opts = {}


require("lazy").setup(plugins, opts)
require("nord").set()
vim.cmd.colorscheme "nord"
local builtin = require("telescope.builtin")

-- telescope key maps
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})

-- neo-tree key maps
vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
