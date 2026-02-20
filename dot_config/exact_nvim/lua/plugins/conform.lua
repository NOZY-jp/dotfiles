return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      dprint = {
        require_cwd = true,
      },
      ["biome-check"] = {
        require_cwd = true,
      },
      ruff_format = {
        command = "ruff",
        args = { "format", "--stdin-filename", "$FILENAME", "-" },
        stdin = true,
      },
      ruff_fix = {
        command = "ruff",
        args = { "check", "--fix", "--stdin-filename", "$FILENAME", "-" },
        stdin = true,
      },
    },

    formatters_by_ft = {
      lua = { "stylua" },
      scss = { "dprint" },
      javascript = { "dprint", "biome-check" },
      typescript = { "dprint", "biome-check" },
      typescriptreact = { "dprint", "biome-check" },
      javascriptreact = { "dprint", "biome-check" },
      fish = { "fish_indent" },
      typst = { "typstyle" },
      python = { "ruff_fix", "ruff_format" },
    },

    format_on_save = {
      timeout_ms = 2000,
      lsp_fallback = true,
    },
  },
}
