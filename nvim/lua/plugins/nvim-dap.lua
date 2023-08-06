return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-telescope/telescope-dap.nvim",
	},
	config = function()
    local function map(mode, lhs, rhs, opts)
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    map("n", "<F5>", function() require("dap").continue() end)
    map("n", "<F6>", function() require("dap").step_into() end)
    map("n", "<F7>", function() require("dap").step_over() end)
    map("n", "<F8>", function() require("dap").step_out() end)
    map("n", "<F9>", function() require("dap").terminate() end)
    map("n", "<Leader>db", function() require("dap").toggle_breakpoint() end)
    map("n", "<Leader>dc", function() require("dap").set_breakpoint(vim.fn.input("condition point: ")) end)
    map("n", "<Leader>dl", function() require "telescope".extensions.dap.list_breakpoints {} end)
    map("n", "<Leader>dr", function() require("dap").clear_breakpoints() end)
    map({ "n", "v" }, "<Leader>dh", function()
      require("dap.ui.widgets").hover()
    end)
    map({ "n", "v" }, "<Leader>dp", function()
      require("dap.ui.widgets").preview()
    end)
    map("n", "<Leader>df", function()
      local widgets = require("dap.ui.widgets")
      widgets.centered_float(widgets.frames)
    end)
    map("n", "<Leader>ds", function()
      local widgets = require("dap.ui.widgets")
      widgets.centered_float(widgets.scopes)
    end)

		local dap = require("dap")
		dap.adapters.codelldb = {
			type = "server",
			host = "127.0.0.1",
			port = 13000, -- 💀 Use the port printed out or specified with `--port`
		}
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				-- CHANGE THIS to your path!
				command = "/home/fhawk/.local/share/nvim/mason/bin/codelldb",
				args = { "--port", "${port}" },
				-- On windows you may have to uncomment this:
				-- detached = false,
			},
		}
		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp
	end,
}
