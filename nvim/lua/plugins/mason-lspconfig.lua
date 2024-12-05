return {
  {
	"williamboman/mason.nvim",
    build = ":MasonUpdate", -- Jalankan :MasonUpdate setelah instalasi
  },

  {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
	  "neovim/nvim-lspconfig",
	},
	 config = function ()
	  require("mason").setup()

	  require("mason-lspconfig").setup({
		ensure_installed = { "lua_ls", "clangd", "pyright", "ts_ls"},
	  })
	  --
	  -- Konfigurasi LSP menggunakan lspconfig
	  local lspconfig = require("lspconfig")
	  require("mason-lspconfig").setup_handlers {
		-- The first entry (without a key) will be the default handler
		-- and will be called for each installed server that doesn't have
		-- a dedicated handler.
		function (server_name) -- default handler (optional)
		  require("lspconfig")[server_name].setup {}
		end,

		-- Specific Config for Lua
		["lua_ls"] = function ()
		  lspconfig.lua_ls.setup {
			on_init = function(client)
			  if client.workspace_folders then
				local path = client.workspace_folders[1].name
				if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
				  return
				end
			  end

			  client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
				runtime = {
				  -- Tell the language server which version of Lua you're using
				  -- (most likely LuaJIT in the case of Neovim)
				  version = 'LuaJIT'
				},
				-- Make the server aware of Neovim runtime files
				workspace = {
				  checkThirdParty = false,
				  library = {
					vim.env.VIMRUNTIME,
					-- Depending on the usage, you might want to add additional paths here.
					"${3rd}/luv/library",
					-- "${3rd}/busted/library",
				  }
				  -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
				  -- library = vim.api.nvim_get_runtime_file("", true)
				}
			  })
			end,
			settings = {
			  Lua = {}
			}
		  }
		end,
	  }
	end,
  },
}

