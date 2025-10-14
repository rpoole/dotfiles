local M = {}

local items = {
  { label = "BufferLine: Sort by extension", cmd = "BufferLineSortByExtension" },
  { label = "Open nvim settings.lua", cmd = "edit ~/.config/nvim/lua/settings.lua" },
}

local function run(item)
   if not item then return end
   vim.cmd(item.cmd)
end

function M.open()
  vim.ui.select(items, {
    prompt = "Common Commands",
    format_item = function(it) return it.label end,
  }, run)
end

-- Ex command so you can :CommonCommands
vim.api.nvim_create_user_command("CommonCommands", M.open, {})

return M
