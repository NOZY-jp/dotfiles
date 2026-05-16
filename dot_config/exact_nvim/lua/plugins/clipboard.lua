return {
	"AstroNvim/astrocore",
	---@param opts AstroCoreOpts
	opts = function(_, opts)
		local is_wsl = (vim.fn.has("unix") == 1 and vim.fn.readfile("/proc/version")[1]:lower():match("microsoft"))
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
			vim.g.clipboard = {
				name = "WslClipboard",
				copy = {
					["+"] = "win32yank.exe -i --crlf",
					["*"] = "win32yank.exe -i --crlf",
				},
				paste = {
					["+"] = "win32yank.exe -o --lf",
					["*"] = "win32yank.exe -o --lf",
				},
				cache_enabled = 0,
			}
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
