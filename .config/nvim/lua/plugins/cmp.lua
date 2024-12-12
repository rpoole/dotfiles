return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
    },
    lazy = false,
    config = function()
        cmp = require("cmp")
        -- load cmp
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<esc>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<tab>"] = cmp.mapping.select_next_item(),
                ["<s-tab>"] = cmp.mapping.select_prev_item(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
            }, {
                { name = 'buffer' },
            }),
            experimental = {
                ghost_text = false -- this feature conflict with copilot.vim's preview.
            }
        })
    end,
}
