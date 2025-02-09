require("options.options")

vim.g.mapleader = ","
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazypath
        }
    )
end

vim.opt.rtp:prepend(lazypath)

-- Set up lazy, and load my `plugins/` folder
require("lazy").setup(
    {import = "plugins"},
    {
        change_detection = {
            notify = false
        }
    }
)

require("options.appearance")
require("options.keymaps")
require("options.terminal")
require("options.menu")
require("options.filetypes")
require("docs.man")
