vim.fn.sign_define("DiagnosticSignError",
{text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
{text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
{text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
{text = "󰌵", texthl = "DiagnosticSignHint"})

require("neo-tree").setup({
    sources = { "filesystem", "git_status", "document_symbols" },
    position = "right",
    cmd = { "Neotree" },
    filesystem = {
        filtered_items = {
            visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
            hide_dotfiles = false,
            hide_gitignored = true,
        },
    },
    document_symbols = {
          follow_cursor = true,
          client_filters = "all",
          window = {
            mappings = {
              ["<CR>"] = "toggle_node",
            },
          },
          -- kinds = {
          --   File = { icon = "", hl = "@text" },
          --   Module = { icon = "", hl = "@text" },
          --   Namespace = { icon = "", hl = "@namespace" },
          --   Package = { icon = "", hl = "@string" },
          --   Class = { icon = "", hl = "@type" },
          --   Method = { icon = "", hl = "@method" },
          --   Property = { icon = "", hl = "@property" },
          --   Field = { icon = "", hl = "@field" },
          --   Constructor = { icon = " ", hl = "@constructor" },
          --   Enum = { icon = "", hl = "@type" },
          --   Interface = { icon = "", hl = "@type" },
          --   Function = { icon = "", hl = "@function" },
          --   Variable = { icon = "", hl = "@variable" },
          --   Constant = { icon = "", hl = "@constant" },
          --   String = { icon = "", hl = "@string" },
          --   Number = { icon = "", hl = "@number" },
          --   Boolean = { icon = "", hl = "@boolean" },
          --   Array = { icon = "", hl = "@variable" },
          --   Object = { icon = "", hl = "@type" },
          --   Key = { icon = "", hl = "@variable" },
          --   -- Null = { icon = "ﳠ", hl = "@boolean" },
          --   EnumMember = { icon = "", hl = "@property" },
          --   Struct = { icon = "", hl = "@type" },
          --   Event = { icon = "", hl = "@variable.builtin" },
          --   Operator = { icon = "", hl = "@operator" },
          --   TypeParameter = { icon = "", hl = "@type" },
          -- },
        },
})
