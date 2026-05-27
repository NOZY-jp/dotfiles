local vim = _G["vim"]

return {
  {
    "AstroNvim/astrolsp",
    optional = true,
    init = function()
      vim.lsp.commands["setContext"] = function() end
      local client = vim.lsp.Client
      if client and type(client.supports_method) == "function" then
        local supports_method = client.supports_method
        client.supports_method = function(self, method, bufnr)
          return supports_method(self, method, bufnr)
        end
      end
    end,
  },
  {
    "stevearc/aerial.nvim",
    optional = true,
    opts = function(_, opts)
      opts.backends = { "lsp", "markdown", "man" }
    end,
  },
}
