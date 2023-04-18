return {
  -- Settings for linting for python files
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright
	settings = {
        python = {
          analysis = {
            typeCheckingMode = "off"
          }
        }
	},
}