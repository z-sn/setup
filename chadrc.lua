-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

-- chadrc.lua or custom.lua configuration file
-- vim.api.nvim_create_autocmd("BufWritePre", {
--    pattern = {"*.c", "*.h"},
--    callback = function()
--        vim.cmd("silent! !clang-format -i %")
--        vim.cmd("edit!")  -- Refresh buffer after formatting
--    end,
--})

-- chadrc.lua or custom.lua configuration file
vim.api.nvim_set_keymap("n", "<leader>cf", ":!clang-format -i %<CR><CR>", { noremap = true, silent = true })

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "catppuccin",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
  hl_override = {
    NvimTreeCursorLine = {
         bg = "#42f545",  -- or any other color from the palette
         fg = "#1923bd",      -- set to fit within Catppuccin's colors
    },
  }
}

-- Full file path on status bar
vim.cmd("highlight St_relativepath guifg=#626a83 guibg=#2a2b36")

local stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

-- Enable Mouse Support
vim.o.mouse = "a"
-- vim.o.clipboard = "unnamedplus"


M.ui = {
  statusline = {
    theme = "default",
    order = { "mode", "relativepath", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor", },
    modules = {
      relativepath = function()
        local path = vim.api.nvim_buf_get_name(stbufnr())

        if path == "" then
          return ""
        end

        return "%#St_relativepath#  " .. vim.fn.expand("%:.:h") .. "/"
      end,
    },
  },
}

return M


