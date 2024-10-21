return {
  {
    "preservim/nerdtree",
    config = function()
        -- Key mappings for NERDTree
        vim.api.nvim_set_keymap('n', '<C-e>', ':NERDTreeToggle<CR>:NERDTreeMirror<CR>', { noremap = true, silent = true })

        -- NERDTree settings
        vim.g.NERDTreeShowBookmarks = 1
        vim.g.NERDTreeIgnore = { '\\.git' }
        vim.g.NERDTreeChDirMode = 0
        vim.g.NERDTreeQuitOnOpen = 1
        vim.g.NERDTreeMouseMode = 2
        vim.g.NERDTreeShowHidden = 1
        vim.g.NERDTreeKeepTreeInNewTab = 1
        vim.g.nerdtree_tabs_open_on_gui_startup = 0
    end,
  },
}
