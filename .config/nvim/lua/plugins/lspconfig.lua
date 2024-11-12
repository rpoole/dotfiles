return {
  "neovim/nvim-lspconfig",
  config = function()
      -- requires python-lsp-server and python-lsp-ruff
      require'lspconfig'.pylsp.setup{}
  end
}
