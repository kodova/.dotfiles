require("kodova.remap")
require("kodova.lazy")
require("kodova.set")


vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("BazelFmt", { clear = true }),
	pattern = { "*.bazel", "*.bzl", "BUILD", "WORKSPACE" },
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		local file = vim.api.nvim_buf_get_name(buf)
		vim.fn.jobstart({ "buildifier", file }, {
			on_exit = function()
				print("Formatted " .. file)
			end
		})
	end,
})
