return {
    'prettier/vim-prettier',
    config = function()
        vim.g["prettier#config#trailing_comma"] = "all"
    end,
}
