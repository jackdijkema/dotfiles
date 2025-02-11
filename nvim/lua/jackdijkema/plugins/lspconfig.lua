return {
  -- Mason (LSP Manager)
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = function()
      require("mason").setup()
    end
  },

  -- Mason LSP Configuration
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig', 'williamboman/mason.nvim' },
    config = function()
    require("mason").setup()
    require("mason-lspconfig").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          'ts_ls',        -- TypeScript
          'angularls',       -- Angular
          'clangd',          -- C/C++
          'lua_ls',          -- Lua LSP
          'rust_analyzer',
          'emmet_ls',        -- Emmet (for JSX/HTML/CSS completion)
          'tailwindcss',     -- Rust LSP
        },
      })
    end
  },

  -- LSP Config (Setup for Each LSP Server)
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', 'hrsh7th/nvim-cmp' },
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local servers = {
          'ts_ls',
          'lua_ls',
          'angularls',
          'clangd',
          'rust_analyzer',
          'emmet_ls',        -- Emmet (for JSX/HTML/CSS completion)
          'tailwindcss',
      }

      for _, server in ipairs(servers) do
          lspconfig[server].setup({
              capabilities = capabilities
          })
      end

        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = { globals = { 'vim' } },
                }
            }
        })
    end
  },
  }

