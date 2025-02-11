return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        {
            'L3MON4D3/LuaSnip',
            version = 'v2.*',
            build = 'make install_jsregexp',
        },
        { 'saadparwaiz1/cmp_luasnip' },
        "hrsh7th/cmp-nvim-lsp",
    },

    config = function ()
        local luasnip = require 'luasnip'
        local cmp = require'cmp'

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
               ["<C-y>"] = cmp.mapping(
               cmp.mapping.confirm({
                   select = true,
                   behavior = cmp.ConfirmBehavior.Insert,
               }),
               { "i", "c" }
               ),
               ["<C-n>"] = cmp.mapping.select_next_item({
                   behavior = cmp.ConfirmBehavior.Insert,
               }),
               ["<C-p>"] = cmp.mapping.select_prev_item({
                   behavior = cmp.ConfirmBehavior.Insert,
               }),
               ["<C-b>"] = cmp.mapping.scroll_docs(-5),
               ["<C-f>"] = cmp.mapping.scroll_docs(5),
               ["<C-q>"] = cmp.mapping.abort(),
           }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
            })
        })
        luasnip.filetype_extend('javascriptreact', { 'javascript' })
        luasnip.filetype_extend('typescriptreact', { 'typescript' })

    end
}
