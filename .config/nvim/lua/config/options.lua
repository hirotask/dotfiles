-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.clipboard = "unnamed"
opt.conceallevel = 0

-- formatting
g.autoformat = true

-- appearance
opt.shortmess:append("I")
opt.fillchars = { eob = " " }
opt.laststatus = 3
opt.termguicolors = true
