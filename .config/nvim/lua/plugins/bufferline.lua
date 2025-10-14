return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            vim.opt.termguicolors = true
            require("bufferline").setup{
                options = {
                    buffer_close_icon = '',
                    max_name_length = 40,
                }
            }
            vim.keymap.set("n", "<leader>l", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer" })
            vim.keymap.set("n", "<C-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
            vim.keymap.set("n", "<C-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
        end,
    },
}
