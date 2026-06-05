-- NeoVimのキーマップ設定
-- デフォルトのキーマップはLazyVimの設定に従う: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostics" })
