-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "astro",
      "javascript",
      "typescript",
      "tsx",
      "css",
      "html",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
