return {
	"nvimdev/lspsaga.nvim",
	keys = {
		{ "<leader>rn", "<cmd>Lspsaga rename<cr>" },
		{ "<leader>k",  "<cmd>Lspsaga hover_doc<cr>" },
		{ "<leader>o",  "<cmd>Lspsaga outline<cr>" },
		{ "<leader>fd", "<cmd>Lspsaga finder<cr>" },
		{ "<C-\\>",     "<cmd>Lspsaga term_toggle<cr>", mode = {"n", "t"} },
		{ "co",         "<cmd>Lspsaga outgoing_calls<cr>" },
		{ "ci",         "<cmd>Lspsaga incoming_calls<cr>" },
		{ "ca",         "<cmd>Lspsaga code_action<cr>" },

		{ ";d",         "<cmd>Lspsaga peek_definition<cr>" },
		{ "gd",         "<cmd>Lspsaga goto_definition<cr>" },

		{ "[d",         "<cmd>Lspsaga diagnostic_jump_next<cr>" },
		{ "]d",         "<cmd>Lspsaga diagnostic_jump_prev<cr>" },
	},
	init = function()
		require("lspsaga").setup({
      outline = {
        layout = "float",
        max_height = 0.6,
        left_width = 0.3
      }
		})
	end,
}
