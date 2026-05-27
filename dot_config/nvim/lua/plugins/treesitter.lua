---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  -- AstroNvim 5 targets the archived `master` API (`nvim-treesitter.configs`).
  -- `main` is a full rewrite and breaks setup (module 'nvim-treesitter.configs' not found).
  branch = "master",
  opts = {
    -- Neovim 0.12 bundles parsers under stdpath("data")/site/parser, which wins on
    -- runtimepath. Without this, :TSUpdate installs to the plugin dir and the
    -- older bundled parser keeps being used (e.g. missing python "except*" nodes).
    parser_install_dir = vim.fn.stdpath("data") .. "/site",
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
  init = function()
    -- Neovim 0.12+: match[id] returns a list of nodes instead of a single node.
    -- https://github.com/nvim-treesitter/nvim-treesitter/issues/8636
    local orig_get_node_text = vim.treesitter.get_node_text
    vim.treesitter.get_node_text = function(node, source, opts)
      if type(node) == "table" and node.range == nil then
        node = node[1]
      end
      return orig_get_node_text(node, source, opts)
    end
  end,
}
