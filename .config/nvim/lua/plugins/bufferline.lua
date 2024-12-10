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
           }
       }
     end,
  },
}
