require("conform").setup{
    formatters_by_ft = {
        csharp = { "csharpier" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
}
