return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "clangd", "jdtls", "pyright", "gopls" },
		})

		local lspconfig = require("lspconfig")
		-- Setup language servers.
		lspconfig.lua_ls.setup({})
		lspconfig.clangd.setup({ capabilities = { offsetEncoding = "utf-8" } })
		lspconfig.jdtls.setup({})
	end,
}
