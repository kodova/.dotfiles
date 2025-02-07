local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

vim.g.markdown_fenced_languages = {
	"ts=typescript"
}

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		"html",
		"htmx",
		"clangd",
		"gopls",
		"lua_ls",
		"tailwindcss",
		"terraform_lsp",
		"bzl",
		"cssls",
		"nxls",
		"angularls",
		"ts_ls",
	},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
		angularls = function()
			require('lspconfig').angularls.setup({
				root_dir = require('lspconfig.util').root_pattern('angular.json', 'nx.json'),
			})
		end,
		lua_ls = function()
			require('lspconfig').lua_ls.setup({
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT',
						},
						diagnostics = {
							globals = { 'vim' },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})
		end
	}
})

--[[
 require('lspconfig').gopls.setup({
	settings = {
		gopls = {
			 env = {
			 	GOPACKAGESDRIVER = './tools/gopls.sh',
			 },
			 directoryFilters = {
		 		"-bazel-bin",
		         "-bazel-out",
			 	"-bazel-testlogs",
		         "-bazel-mypkg",
			 },

		}
	}
})

--[[
]] --


local cmp = require('cmp')
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),

	}),
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
})
