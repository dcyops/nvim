return {
  "nvim-telescope/telescope-project.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },

  config = function()
    require("plugins_conf.telescope-project")
  end,
}
