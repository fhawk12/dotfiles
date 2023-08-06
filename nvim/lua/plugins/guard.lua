return {
	"nvimdev/guard.nvim",
	keys = {
		{ "<leader>fm", "<cmd>GuardFmt<cr>", mode = { "n", "v" } },
	},
  enabled = false,
	config = function()
		local ft = require("guard.filetype")
		ft("c"):fmt("clang-format")
		ft("cpp"):fmt("clang-format")
		ft("lua"):fmt("stylua")
		ft("python"):fmt("black")
		ft("sh"):fmt("lsp")
		ft("markdown"):fmt("prettier")
		ft("typescript,javascript,typescriptreact"):fmt("prettier")
		require("guard").setup({
			-- the only options for the setup function
			fmt_on_save = true,
			-- Use lsp if no formatter was defined for this filetype
			lsp_as_default_formatter = false,
		})
	end,
}
