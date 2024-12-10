local is_mac = vim.loop.os_uname().sysname == "Darwin"

-- Set mapleader
vim.g.mapleader = ","

-- Set viminfo options
vim.opt.viminfo = "%,'25,f1,<300,:100,/100,h"

-- Disable search highlight
vim.opt.hlsearch = false

-- Enable persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.local/share/nvim/undo")

-- Disable swapfile, backup, and write backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Disable text wrap and set text width
vim.opt.wrap = false
vim.opt.textwidth = 79
vim.opt.formatoptions = "qrn1"

-- Set tab and indentation settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.number = true -- Show line numbers

-- So window moves with j and k
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })

-- Buffer movement mappings
vim.api.nvim_set_keymap('n', '<leader>bb', '<C-^>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bd', ':bd<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':bp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':bn<CR>', { noremap = true, silent = true })

-- Window manipulation mappings
vim.api.nvim_set_keymap('n', '<leader>w', '<C-w>v<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>j', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>x', ':x<CR>', { noremap = true, silent = true })

-- Full page scrolling modification
vim.api.nvim_set_keymap('n', '<C-f>', '10k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-b>', '10j', { noremap = true, silent = true })

-- LSP config
vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>i', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({timeout_ms = 50000})<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })

-- Keep cursor away from edges of the screen
vim.opt.scrolloff = 14

-- Hybrid line numbers (absolute + relative)
vim.opt.number = true
vim.opt.relativenumber = true

-- Reload last cursor position
local lastplace = vim.api.nvim_create_augroup("LastPlace", {})
vim.api.nvim_clear_autocmds({group = lastplace})
vim.api.nvim_create_autocmd(
    "BufReadPost",
    {
        group = lastplace, pattern = {"*"}, desc = "remember last cursor place", callback = function()
            local mark = vim.api.nvim_buf_get_mark(0, '"')
            local lcount = vim.api.nvim_buf_line_count(0)
            if mark[1] > 0 and mark[1] <= lcount then
                pcall(vim.api.nvim_win_set_cursor, 0, mark)
            end
        end
    }
)

if not is_mac then
    -- WSL clipboard
    vim.g.clipboard = {
        name = "win32yank-wsl",
        copy = {
            ["+"] = "win32yank.exe -i --crlf",
            ["*"] = "win32yank.exe -i --crlf",
        },
        paste = {
            ["+"] = "win32yank.exe -o --lf",
            ["*"] = "win32yank.exe -o --lf",
        },
        cache_enabled = true,
    }
end

vim.opt.clipboard = "unnamedplus"

-- Close quickfix window after selection
vim.api.nvim_create_autocmd( "FileType", {
    pattern={"qf"},
    command=[[nnoremap <buffer> <CR> <CR>:cclose<CR>]]
})
