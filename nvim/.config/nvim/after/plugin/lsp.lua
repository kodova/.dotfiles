local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

local cmp = require('cmp')
cmp.setup({
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
	},
})


require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		"html",
		"gopls",
		"lua_ls",
		"tailwindcss",
	},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
		lua_ls = function()
			require('lspconfig').lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = {'vim'},
						},
					},
				},
			})
		end
	}
})

