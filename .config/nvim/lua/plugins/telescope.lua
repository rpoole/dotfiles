return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim', 
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
    },
    keys = {
      { "<C-p>", function() require("telescope.builtin").find_files() end, desc="Find Files" },
      { "<C-k>", function() require("telescope.builtin").live_grep() end, desc="Live Grep" },
      { "<C-n>", function() require'telescope.builtin'.lsp_references() end, desc="References" },
    },
    config = function()
      local actions = require('telescope.actions')

      require('telescope').setup{
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
          },
        },
      }
    end,
}

