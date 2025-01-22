return {
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
      dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  {
    "romgrk/barbar.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  -----------------------------------------
  -- Telescope
  -----------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "smartpde/telescope-recent-files",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("recent_files")

      vim.api.nvim_set_keymap(
        "n",
        "<Leader><Leader>",
        [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
        { noremap = true, silent = true }
      )
    end,
  },
  {
    "nvim-telescope/telescope-project.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").setup({
        extensions = {
          project = {
            base_dirs = {
              "~/.Repos/github.com/aGVsbG8sIHRoZXJl",
            },
            hidden_files = true,
            theme = "dropdown",
            order_by = "asc",
            search_by = "title",
            sync_with_nvim_tree = true,
            on_project_selected = function(prompt_bufnr)
              local project_actions = require("telescope._extensions.project.actions")
              project_actions.change_working_directory(prompt_bufnr, false)
            end,
          },
        },
      })
      require("telescope").load_extension("project")
      vim.keymap.set(
        "n",
        "<C-p>",
        ":lua require'telescope'.extensions.project.project{}<CR>",
        { noremap = true, silent = true }
      )
    end,
  },
  {
    "ahmedkhalf/project.nvim",
  },

  -----------------------------------------

  {
    "MunifTanjim/nui.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "kawre/leetcode.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      -- configuration goes here
    },
  },
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup()
      vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
    end,
  },
  {
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup({})
      end,
    },
  },
  {
    "terryma/vim-multiple-cursors",
  },
  -- Discord activity status plugin
  {
    "vyfor/cord.nvim",
    build = "./build || .\\build",
    event = "VeryLazy",
    opts = {}, -- calls require('cord').setup()
  },

  {
    "RRethy/vim-illuminate",
  },
  {
    "machakann/vim-highlightedyank",
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
}
