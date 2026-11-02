return {
  "neovim/nvim-lspconfig",
  config = function()
    -- ruby-lsp: stock config supplies cmd/root markers; only narrow the
    -- feature set and keep it to plain ruby buffers.
    vim.lsp.config("ruby_lsp", {
      filetypes = { "ruby" },
      init_options = {
        enabledFeatures = {
          "definition",
          "typeDefinition",
          "documentHighlights",
          "documentSymbols",
          "foldingRanges",
          "selectionRanges",
          "codeActions",
          "hover",
          "signatureHelp",
          "rename",
          "publishDiagnostics",
        },
      },
    })

    vim.lsp.enable({
      "pylsp", -- requires python-lsp-server and python-lsp-ruff
      "ruby_lsp",
      "rubocop",
      "ts_ls",
      "eslint",
      "oxfmt",
      "gopls",
    })
  end,
}
