return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "shfmt",
        "stylua",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        bash = { "shfmt" },
        lua = { "stylua" },
        typescript = { "prettier", "prettierd" },
        javascript = { "prettier", "prettierd" },
        json = { "prettier", "prettierd" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  },
}
