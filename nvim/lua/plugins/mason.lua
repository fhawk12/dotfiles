return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "clangd", "jdtls", "pyright" },
		})

		local lspconfig = require("lspconfig")
		-- Setup language servers.
		lspconfig.lua_ls.setup({})
		lspconfig.clangd.setup({ capabilities = { offsetEncoding = "utf-8" } })
		lspconfig.marksman.setup({})
		lspconfig.prosemd_lsp.setup({})
		lspconfig.jdtls.setup({})
		-- lspconfig.java_language_server.setup({})
		lspconfig.pyright.setup({})
		lspconfig.tsserver.setup({})
		lspconfig.rust_analyzer.setup({
			-- Server-specific settings. See `:help lspconfig-setup`
			settings = {
				["rust-analyzer"] = {},
			},
		})
	end,
}
