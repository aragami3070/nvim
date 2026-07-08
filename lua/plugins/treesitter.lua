local parsers_to_install = {
    "cpp",
    "rust",
    "lua",
    "markdown",
    "typst",
    "html",
    "css",
    "javascript",
    "typescript",
    "dockerfile",
    "bash",
    "json5",
    "markdown_inline",
}

require("nvim-treesitter").setup()

-- Install the required parsers
require("nvim-treesitter").install(parsers_to_install)

-- Enable Treesitter highlighting globally
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function(args)
        -- Ignore latex
        if vim.bo[args.buf].filetype == "tex" or vim.bo[args.buf].filetype == "latex" then
            return
        end
        pcall(vim.treesitter.start, args.buf)
    end,
})

-- Enable Treesitter indentation globally
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function(args)
        if vim.bo[args.buf].filetype == "tex" or vim.bo[args.buf].filetype == "latex" then
            return
        end
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})
