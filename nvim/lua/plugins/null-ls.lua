return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local diagnost = null_ls.builtins.diagnostics
		local code_action = null_ls.builtins.code_actions
		null_ls.setup({
			sources = {
				formatting.prettier,
				formatting.cbfmt,
				formatting.stylua,
				formatting.clang_format,

				-- diagnost.clang_check,
				-- diagnost.cppcheck,

				code_action.refactoring,
        code_action.gitsigns
			},
		})
	end,
}
