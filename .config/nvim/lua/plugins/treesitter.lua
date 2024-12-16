return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "ruby", "javascript", "typescript", "tsx" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true, disable = { "ruby", "javascript", "typescript", "txt" } },
        })
    end
}
