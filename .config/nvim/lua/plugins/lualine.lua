return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "auto", -- テーマ自動選択（'gruvbox', 'tokyonight'など指定も可）
      section_separators = "", -- セクション区切り文字
      component_separators = "", -- コンポーネント区切り文字
      icons_enabled = true, -- アイコン表示（devicons推奨）
    },
    sections = {
      lualine_a = { "mode" }, -- 左端: モード表示
      lualine_b = { "branch", "diff" }, -- 左: Gitブランチ、変更差分
      lualine_c = { { "filename", path = 2 } }, -- 中央: ファイル名
      lualine_x = { "encoding", "fileformat", "filetype" }, -- 右: 文字コードなど
      lualine_y = { "progress" }, -- 右: 進行バー
      lualine_z = { "location" }, -- 右端: 行・列番号
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { { "filename", path = 2 } },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  },
}
