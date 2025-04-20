local bash_options = {
	shell = "bash.exe",
	shellcmdflag = "--login -i -c",
	shellredir = "",
	shellpipe = "2>&1",
	shellquote = "",
	shellxquote = "",
}

for option, value in pairs(bash_options) do
	vim.opt[option] = value
end

require("toggleterm").setup({
	open_mapping = [[<c-\>]],
	shell = "bash.exe",
})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", ":;", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
