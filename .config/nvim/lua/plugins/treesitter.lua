return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "ruby" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true, disable = { "ruby" } },
        })
    end
}
