return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      -- 選択時に補完項目を挿入、デフォルトでは選択しない
      list = {
        selection = {
          auto_insert = false,
        },
      },
    },
    keymap = {
      preset = "super-tab",
    },
  },
}
