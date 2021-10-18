require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "javascript" },
  },
  indent = {
    enable = true,
    disable = { "javascript" },
  }
}


local lspconfig = require'lspconfig'
local coq = require "coq" -- add this

lspconfig.solargraph.setup(coq.lsp_ensure_capabilities{})
lspconfig.tsserver.setup(coq.lsp_ensure_capabilities{})

vim.g.coq_settings = {
    keymap = {
        jump_to_mark = "",
    },
    clients = {
        tmux = {
            enabled = false
        },
        tree_sitter = {
            enabled = false
        },
    }
}
vim.cmd('COQnow -s')


require'nvim-web-devicons'.setup {
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

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

