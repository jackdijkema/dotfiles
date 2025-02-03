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
    dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          'ts_ls',        -- TypeScript
          'angularls',       -- Angular
          'clangd',          -- C/C++
          'harper_ls',       -- Harper Language Server
          'lua_ls',          -- Lua LSP
          'rust_analyzer',   -- Rust LSP
          'jdtls',           -- Java LSP
        }
      })
    end
  },

  -- LSP Config (Setup for Each LSP Server)
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' },
    config = function()
      local lspconfig = require('lspconfig')


      -- Common LSP Server Setup
      local servers = {
        'ts_ls', 'angularls', 'clangd', 'harper_ls',
        'lua_ls', 'rust_analyzer', 'jdtls'
      }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({})
      end


      -- Lua LSP (Example with Custom Settings)
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
            telemetry = { enable = false },
          }
        }
      })
    end
  },


    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip'
    },
    config = function()
      local cmp = require('cmp')


      local cmp_select = {behavior = cmp.SelectBehavior.select}

      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_ite(cmp_select),
          ['<C-y>'] = cmp.mapping.confirm({select = true}),
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      })
    end
  }

