local keymap = vim.keymap

-- Navigation
keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
keymap.set("n", "<C-l>", "<C-w>l", { silent = true })
keymap.set("n", "<C-e>", "$", { silent = true })
keymap.set("n", "<C-a>", "0", { silent = true })
keymap.set("n", "<C-f>", "b", { silent = true })
keymap.set("n", "<C-j>", "w", { silent = true })
keymap.set("i", "<C-e>", "<ESC>$a", { silent = true })
keymap.set("i", "<C-a>", "<ESC>0i", { silent = true })
keymap.set("i", "<C-f>", "<ESC>bi", { silent = true })
keymap.set("i", "<C-j>", "<ESC>wi", { silent = true })
keymap.set("n", "<leader>s", ":w<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>,", "<Cmd>BufferPrevious<CR>", { silent = true })
keymap.set("n", "<leader>.", "<Cmd>BufferNext<CR>", { silent = true })
keymap.set("n", "<leader>x", "<Cmd>BufferClose<CR>", { silent = true })

-- Prevent VIM from adding the deleted value from adding to the clipboard.
keymap.set("n", "d", '"_d', { noremap = true, silent = true })
keymap.set("x", "d", '"_d', { noremap = true, silent = true })
keymap.set("x", "p", '"_dP', { noremap = true, silent = true })
