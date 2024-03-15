return { 
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
  }
