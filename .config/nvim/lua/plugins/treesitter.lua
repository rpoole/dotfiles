return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")
        local languages = { "ruby", "javascript", "typescript", "tsx" }

        -- Install parsers (no-op if already installed; runs async).
        ts.install(languages)

        -- Filetypes that should not use treesitter indentation.
        local no_indent = { javascript = true, typescript = true, txt = true }

        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("treesitter_setup", { clear = true }),
            callback = function(args)
                local ft = args.match
                local lang = vim.treesitter.language.get_lang(ft) or ft
                if not vim.treesitter.language.add(lang) then
                    return
                end

                -- Highlighting is built into Neovim; start it per buffer.
                pcall(vim.treesitter.start, args.buf, lang)

                if not no_indent[ft] then
                    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end,
}
