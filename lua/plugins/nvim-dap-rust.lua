local dap = require("dap")
if not dap.adapters["codelldb"] then
	require("dap").adapters["codelldb"] = {
		type = "server",
		host = "127.0.0.1",
		port = "${port}",
		executable = {
			command = "codelldb",
			args = {
				"--port",
				"${port}",
			},
		},
	}
end

for _, lang in ipairs({ "rust" }) do
	dap.configurations[lang] = {
		{
			type = "codelldb",
			request = "launch",
			name = "Launch file (more compact)",
			program = function()
				return vim.fn.input(
					"Path to executable: ",
					vim.fn.getcwd() .. "/target/debug/" .. vim.fn.substitute(vim.fn.getcwd(), "^.*/", "", ""),
					"file"
				)
			end,
			cwd = "${workspaceFolder}",
			sourceLanguages = {'rust'}
		},

		{
			type = "codelldb",
			request = "launch",
			name = "Launch with args (more compact)",
			program = function()
				return vim.fn.input(
					"Path to executable: ",
					vim.fn.getcwd() .. "/target/debug/" .. vim.fn.substitute(vim.fn.getcwd(), "^.*/", "", ""),
					"file"
				)
			end,
			args = function()
				local args = {}
				vim.ui.input({ prompt = "args: ", completion = "shellcmd" }, function(input)
					args = vim.split(input, " ")
				end)
				return args
			end,
			cwd = "${workspaceFolder}",
			sourceLanguages = {'rust'}
		},

		{
			type = "codelldb",
			request = "attach",
			name = "Attach to process (more compact)",
			pid = function()
				return vim.fn.input("Input pid: ")
			end,
			cwd = "${workspaceFolder}",
			sourceLanguages = {'rust'}
		},

		{
			type = "codelldb",
			request = "launch",
			name = "Launch file",
			program = function()
				return vim.fn.input(
					"Path to executable: ",
					vim.fn.getcwd() .. "/target/debug/" .. vim.fn.substitute(vim.fn.getcwd(), "^.*/", "", ""),
					"file"
				)
			end,
			cwd = "${workspaceFolder}",
		},

		{
			type = "codelldb",
			request = "launch",
			name = "Launch with args",
			program = function()
				return vim.fn.input(
					"Path to executable: ",
					vim.fn.getcwd() .. "/target/debug/" .. vim.fn.substitute(vim.fn.getcwd(), "^.*/", "", ""),
					"file"
				)
			end,
			args = function()
				local args = {}
				vim.ui.input({ prompt = "args: ", completion = "shellcmd" }, function(input)
					args = vim.split(input, " ")
				end)
				return args
			end,
			cwd = "${workspaceFolder}",
		},

		{
			type = "codelldb",
			request = "attach",
			name = "Attach to process",
			pid = function()
				return vim.fn.input("Input pid: ")
			end,
			cwd = "${workspaceFolder}",
		},
	}
end
