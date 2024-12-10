return {
    {
        "github/copilot.vim",
        cond = function()
            return os.getenv("DEV_ENV_TYPE") == "WORK"
        end,
        config = function()
            vim.g.copilot_no_tab_map = true -- disable tab mapping
            vim.api.nvim_set_keymap('i', '<c-f>', 'copilot#Accept("<CR>")', { silent = true, expr = true, script = true }) -- map accept to ctrl-f
        end,
    },
}

