return {
  "AstroNvim/astrocore",
  ---@param opts AstroCoreOpts
  opts = function(_, opts)
    local is_wsl = vim.fn.has("unix") == 1
      and vim.fn.readfile("/proc/version")[1]:lower():match("microsoft")
    local is_ssh = os.getenv("SSH_TTY") ~= nil

    if is_ssh then
      vim.g.clipboard = {
        name = "OSC 52",
        copy = {
          ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
          ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
        },
        paste = {
          ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
          ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
        },
      }
    elseif is_wsl then
      local win32yank = vim.fn.expand("~/bin/win32yank.exe")
      if vim.fn.executable(win32yank) ~= 1 then
        vim.notify(
          ("win32yank not found at %s — WSL/Windows clipboard sync disabled"):format(win32yank),
          vim.log.levels.WARN
        )
      else
        vim.g.clipboard = {
          name = "WslClipboard",
          copy = {
            ["+"] = { win32yank, "-i", "--crlf" },
            ["*"] = { win32yank, "-i", "--crlf" },
          },
          paste = {
            ["+"] = { win32yank, "-o", "--lf" },
            ["*"] = { win32yank, "-o", "--lf" },
          },
          cache_enabled = 0,
        }
      end
    end

    if not opts.options then
      opts.options = {}
    end
    if not opts.options.opt then
      opts.options.opt = {}
    end
    opts.options.opt.clipboard = "unnamedplus"

    return opts
  end,
}
