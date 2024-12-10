return {
    'Exafunction/codeium.nvim',
    event = 'BufEnter',
    cond = function()
        return os.getenv("DEV_ENV_TYPE") ~= "WORK"
    end,
    config = function()
        require("codeium").setup({
            enable_cmp_source = false,
            virtual_text = {
                enabled = true,
                key_bindings = {
                    accept = "<c-f>",
                }

            }
        })
    end,
}
