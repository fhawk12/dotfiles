return {
	"xeluxee/competitest.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	keys = {
		{ "<leader>;r", "<cmd>CompetiTest run<cr>" },
		{ "<leader>;a", "<cmd>CompetiTest receive testcases<cr>" },
		{ "<leader>;d", "<cmd>CompetiTest delete_testcase testcases<cr> <cmd>lua delete_executable_files()<cr>" },
		{ "<leader>;c", "<cmd>CompetiTest receive contest<cr>" },
	},
	config = function()
		require("competitest").setup()
	end,
}
