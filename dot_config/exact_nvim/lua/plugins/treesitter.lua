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
      "rust",
      "markdown",
      "markdown_inline",
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    -- Patch for Neovim 0.12+: match[id] returns a list of nodes instead of a single node.
    -- Without this, get_node_text receives a table and calls table:range() → nil error.
    -- https://github.com/nvim-treesitter/nvim-treesitter/issues/8636
    -- NOTE: nvim-treesitter is archived (2026-04-03), this won't be fixed upstream.
    local ok, mod = pcall(require, "nvim-treesitter.query_predicates")
    if ok then
      local orig_get_node_text = vim.treesitter.get_node_text
      vim.treesitter.get_node_text = function(node, source, opts)
        if type(node) == "table" then
          node = node[1]
        end
        return orig_get_node_text(node, source, opts)
      end
    end
  end,
}
