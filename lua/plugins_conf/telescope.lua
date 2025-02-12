local data = assert(vim.fn.stdpath "data") --[[@as string]]

require("telescope").setup {
  defaults = {
    file_ignore_patterns = { "dune.lock" },
    history = {
      path = vim.fs.joinpath(data, "telescope_history.sqlite3"),
      limit = 100,
    },
  },
  extensions = {
    smart_history = {
      cycle = true,
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {},
    },
  },
}

pcall(require("telescope").load_extension, "smart_history")

vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true, silent = true })

local builtin = require "telescope.builtin"

vim.keymap.set("n", "<space>rps", function()
  builtin.find_files { cwd = "~/.Repos/github.com/aGVsbG8sIHRoZXJl" }
end)

vim.keymap.set("n", "<space>eo", function()
  builtin.find_files { cwd = "~/.config/nvim" }
end)
