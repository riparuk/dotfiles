return {
  {
	"hrsh7th/nvim-cmp",
	dependencies = {
	  "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
	  "hrsh7th/cmp-buffer", -- buffer auto-completion
	  "hrsh7th/cmp-path", -- path auto-completion
	  "hrsh7th/cmp-cmdline", -- cmdline auto-completion
	  -- For LuaSnip
	  "L3MON4D3/LuaSnip",
	  "saadparwaiz1/cmp_luasnip",
	},
	config = function ()
	  -- Set up nvim-cmp.
	  local cmp = require'cmp'

	  cmp.setup({
		snippet = {
		  -- REQUIRED - you must specify a snippet engine
		  expand = function(args)
			require('luasnip').lsp_expand(args.body)
		  end,
		},
		window = {
		  -- completion = cmp.config.window.bordered(),
		  documentation = cmp.config.window.bordered(),
		},

		mapping = cmp.mapping.preset.insert({
		  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
		  ['<C-f>'] = cmp.mapping.scroll_docs(4),
		  ['<C-Space>'] = cmp.mapping.complete(),
		  ['<C-e>'] = cmp.mapping.abort(),
		  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),

		sources = cmp.config.sources({
		  { name = 'nvim_lsp' },
		  { name = 'luasnip' }, -- For luasnip users.
		}, {
			{ name = 'buffer' },
		  })
	  })

	  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	  cmp.setup.cmdline({ '/', '?' }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
		  { name = 'buffer' }
		}
	  })

	  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	  cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
		  { name = 'path' }
		}, {
			{ name = 'cmdline' }
		  }),
		matching = { disallow_symbol_nonprefix_matching = false }
	  })

	end
  },
}
