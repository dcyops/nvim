return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-smart-history.nvim",
        "kkharji/sqlite.lua",
        "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
        require("plugins_conf.telescope")
    end,
}

