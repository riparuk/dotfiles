return {
  "yioneko/nvim-vtsls",
  config = function()
    local lspconfig = require("lspconfig")
	require("lspconfig.configs").vtsls = require("vtsls").lspconfig

    lspconfig.vtsls.setup({})
  end,
}
