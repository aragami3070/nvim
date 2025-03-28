require("mcphub").setup({
	-- Required options
	port = 3000, -- Port for MCP Hub server
	config = vim.fn.expand("~/.config/nvim/mcpservers.json"), -- Absolute path to config file

	-- Optional options
	on_ready = function(hub)
		-- Called when hub is ready
	end,
	on_error = function(err)
		-- Called on errors
	end,
	log = {
		level = vim.log.levels.WARN,
		to_file = false,
		file_path = nil,
		prefix = "MCPHub",
	},
})

require("avante").setup({
	provider = "openai",
	openai = {
		endpoint = "https://ai.google.dev/",
		model = "deepseek-chat", -- your desired model (or use gpt-4o, etc.)
		timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
		temperature = 0.7,
		max_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
		--reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
	},
	-- other config
	-- The system_prompt type supports both a string and a function that returns a string. Using a function here allows dynamically updating the prompt with mcphub
	system_prompt = function()
		local hub = require("mcphub").get_hub_instance()
		return hub:get_active_servers_prompt()
	end,
	-- The custom_tools type supports both a list and a function that returns a list. Using a function here prevents requiring mcphub before it's loaded
	custom_tools = function()
		return {
			require("mcphub.extensions.avante").mcp_tool(),
		}
	end,
})
