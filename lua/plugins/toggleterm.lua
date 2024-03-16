return {
    'akinsho/toggleterm.nvim',
    version = "*", config = true,
    config = function()
      require("toggleterm").setup{}
      vim.keymap.set('n', '<leader>tf>', ':ToggleTerm direction=float', {})
    end
  }
