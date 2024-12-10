return {
  "neovim/nvim-lspconfig",
  config = function()
      -- requires python-lsp-server and python-lsp-ruff
      require'lspconfig'.pylsp.setup{}

      local configs = require("lspconfig.configs")
      local util = require("lspconfig.util")
      local enabled_features = {
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
          --"formatting",
      }

      configs.ruby_lsp = {
          default_config = {
              cmd = { "ruby-lsp" },
              filetypes = { "ruby" },
              root_dir = util.root_pattern("Gemfile", ".git"),
              init_options = {
                  enabledFeatures = enabled_features,
              },
              settings = {},
          },
      }

      require'lspconfig'.ruby_lsp.setup{}
      require'lspconfig'.rubocop.setup{}
  end
}
