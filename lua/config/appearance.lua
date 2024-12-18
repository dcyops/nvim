vim.cmd([[colorscheme kanagawa]])

-- Nvim-Tree Configuration
require("nvim-tree").setup({
  view = {
    width = 30,
    side = "left",
  },
  renderer = {
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },
    },
  },
  filters = {
    dotfiles = true,
  },
})

-- Barbar Configuration
require("barbar").setup({
  animation = true,
  icons = {
    buffer_index = true,
    filetype = { enabled = true },
  },
})

-- Telescope Configuration
local actions = require("telescope.actions")
require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-x>"] = actions.file_vsplit,
      },
      n = {
        ["<esc>"] = actions.close,
        ["<C-x>"] = actions.file_vsplit,
      },
    },
    path_display = { "truncate" },
    layout_config = {
      width = 0.95,
      preview_cutoff = 120,
      horizontal = {
        preview_width = 0.6,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
})
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

require("project_nvim").setup({
  manual_mode = false,
  show_hidden = true,
  -- Methods of detecting the root directory. **"lsp"** uses the native neovim
  -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
  -- order matters: if one is not detected, the other is used as fallback. You
  -- can also delete or rearangne the detection methods.
  detection_methods = { "lsp", "pattern" },
  -- All the patterns used to detect root dir, when **"pattern"** is in
  -- detection_methods
  --patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

  exclude_dirs = {
    "*/node_modules/*",
    "*/.git/*",
    "*/dist/*",
    "*/build/*",
    "*/venv/*",
    "*/.cache/*",
    "*/.DS_Store/*",
    "*/tmp/*",
    "*/__pycache__/*",
    "*/out/*",
  },
})
