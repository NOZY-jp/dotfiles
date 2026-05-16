---@type LazySpec
return {
  {
    "mrcjkb/rustaceanvim",
    opts = function(_, opts)
      opts.dap = opts.dap or {}
      -- Disable DAP autoload — prevents cargo build on every .rs open
      opts.dap.autoload_configurations = false
      -- Fix codelldb liblldb path — astrocommunity points to wrong $MASON location
      local cfg = require "rustaceanvim.config"
      local codelldb_path = vim.fn.exepath "codelldb"
      if codelldb_path ~= "" then
        local liblldb = vim.fn.expand "$MASON/packages/codelldb/extension/lldb/lib/liblldb.so"
        if vim.uv.fs_stat(liblldb) then
          opts.dap.adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb)
        end
      end
    end,
  },
  {
    "AstroNvim/astrolsp",
    optional = true,
    opts = function(_, opts)
      local maps = opts.mappings or {}
      -- AstroNvim only maps gK (signature help), not K (hover)
      maps.n["K"] = { function() vim.lsp.buf.hover() end, desc = "LSP hover", cond = "textDocument/hover" }
      opts.mappings = maps
    end,
  },
}
