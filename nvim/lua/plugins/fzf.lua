return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
	local actions = require "fzf-lua.actions"
    -- calling `setup` is optional for customization
	
    require("fzf-lua").setup({})
  end
}
