-- open file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- shift lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- append line below to currend
vim.keymap.set("n", "J", "mzJ`z")

-- scroll half page while cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- go to next / prev while cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete to void
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- format current buffer
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- toggle LSP code action
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

-- change current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
