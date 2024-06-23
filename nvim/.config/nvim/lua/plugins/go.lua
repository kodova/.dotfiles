return {
--	"fatih/vim-go",
	"ray-x/go.nvim",
	dependencies = {  -- optional packages
	},
	config = function()
		require("go").setup()
	end,
	event = {"CmdlineEnter"},
	ft = {"go", 'gomod'},
	build = ':lua require("go.install").update_all_sync()'
}
