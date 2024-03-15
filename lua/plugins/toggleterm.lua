return {
    'akinsho/toggleterm.nvim', 
    version = "*", config = true,
    config = function()
      require("toggleterm").setup{}
      vim.keymap.set('n', '<A-t>', ':ToggleTerm direction=float <CR>', {})
    end
  }
