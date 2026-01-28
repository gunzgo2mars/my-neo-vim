-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
local set = vim.api.nvim_set_hl

-- transparent base
set(0, "CmpPmenu", { bg = "NONE" })
set(0, "CmpDoc", { bg = "NONE" })

-- borders (Solarized tones)
set(0, "CmpBorder", { fg = "#586e75", bg = "NONE" })
set(0, "CmpDocBorder", { fg = "#586e75", bg = "NONE" })

-- selection (subtle, readable)
set(0, "CmpSelection", { bg = "#073642" })

-- abbreviation
set(0, "CmpItemAbbr", { fg = "#839496" })
set(0, "CmpItemAbbrMatch", { fg = "#268bd2", bold = true })

-- kinds (Solarized-inspired)
set(0, "CmpItemKindFunction", { fg = "#b58900" })
set(0, "CmpItemKindMethod", { fg = "#b58900" })
set(0, "CmpItemKindVariable", { fg = "#2aa198" })
set(0, "CmpItemKindClass", { fg = "#cb4b16" })
set(0, "CmpItemKindInterface", { fg = "#6c71c4" })
