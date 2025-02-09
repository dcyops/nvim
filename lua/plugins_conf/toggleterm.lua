require("toggleterm").setup{
      vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
  }
