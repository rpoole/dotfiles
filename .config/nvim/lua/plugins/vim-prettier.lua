return {
    'prettier/vim-prettier',
    config = function()
        vim.g["prettier#config#print_width"] = "auto"
    end,
}
