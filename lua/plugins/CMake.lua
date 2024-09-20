return {
    settings = {
        Cmake = {
            filetypes = {"cmake", "CmakeLists.txt"},
        }
    },
	require("cmake-tools").setup {
		cmake_dap_configuration = { -- debug settings for cmake
			name = "cpp",
			type = "codelldb",
			request = "launch",
			stopOnEntry = false,
			runInTerminal = true,
			console = "integratedTerminal",
		}
	}
}
