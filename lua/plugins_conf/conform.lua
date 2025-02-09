require("conform").setup({
  event = { "BufWritePre" },

  format_on_save = function(bufnr)
    if vim.bo[bufnr].filetype == "c" then
      return { timeout_ms = 500, async = true }
    end
    return nil
  end,

  cmd = { "ConformInfo" },

  formatters_by_ft = {
    yaml = { "yamlfmt" },
    yml = { "yamlfmt" },
    c = { "clangformat" },
  },

  formatters = {
    yamlfmt = {
      command = "/home/user/.local/share/go/bin/yamlfmt",
    },
    clangformat = {
      command = "clang-format",
      args = { "-style=file:/home/user/.config/formatters/clang-format" },
    },
  },
})

vim.keymap.set("n", "<leader>f", function()
  require("conform").format({ async = true })
end, { noremap = true, silent = true, desc = "Format buffer" })

