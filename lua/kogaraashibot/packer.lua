vim.cmd.packadd("packer.nvim")

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use({ "catppuccin/nvim", as = "catppuccin"})
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.x", 
    requires = { 
      "nvim-lua/plenary.nvim"
    }
  })
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate"})
  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Requerido
          {                                      -- Opcional
            'williamboman/mason.nvim',
            run = function() pcall(vim.cmd, 'MasonUpdate') end,
          },
          {'williamboman/mason-lspconfig.nvim'}, -- Opcional

          -- Autocompletado
          {'hrsh7th/nvim-cmp'},     -- Requerido
          {'hrsh7th/cmp-nvim-lsp'}, -- Requerido
          {'L3MON4D3/LuaSnip'},     -- Requerido
      }
  }
end)
