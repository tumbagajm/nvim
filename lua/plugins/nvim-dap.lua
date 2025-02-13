return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio", -- Add this line
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- Setup UI
		require("dapui").setup()

		-- Configure Node.js Adapter
		dap.adapters.node2 = {
			type = "executable",
			command = "node",
			args = { os.getenv("HOME") .. "/.config/nvim/debuggers/vscode-node-debug2/out/src/nodeDebug.js" }, -- Adjust path
		}

		-- TypeScript / JavaScript Config
		dap.configurations.typescript = {
			{
				type = "node2",
				request = "launch",
				name = "Launch File",
				program = "${file}",
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = "inspector",
				console = "integratedTerminal",
			},
		}

		dap.configurations.javascript = dap.configurations.typescript

		-- Keybindings
		vim.keymap.set("n", "<F5>", function()
			dap.continue()
		end, { desc = "Start Debugging" })
		vim.keymap.set("n", "<F10>", function()
			dap.step_over()
		end, { desc = "Step Over" })
		vim.keymap.set("n", "<F11>", function()
			dap.step_into()
		end, { desc = "Step Into" })
		vim.keymap.set("n", "<F12>", function()
			dap.step_out()
		end, { desc = "Step Out" })
		vim.keymap.set("n", "<Leader>b", function()
			dap.toggle_breakpoint()
		end, { desc = "Toggle Breakpoint" })
		vim.keymap.set("n", "<Leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Set Conditional Breakpoint" })
		vim.keymap.set("n", "<Leader>dr", function()
			dap.repl.open()
		end, { desc = "Open REPL" })
		vim.keymap.set("n", "<Leader>du", function()
			dapui.toggle()
		end, { desc = "Toggle UI" })

		-- Auto Open/Close DAP UI
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}
