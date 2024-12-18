local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "clangd", "yamlls", "ansiblels", "bashls", "dockerls", "lua_ls", "taplo" },
})

lspconfig.yamlls.setup({
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = {
        kubernetes = "*.yaml", -- Add schemas if needed
      },
    },
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>!yamlfmt -conf ~/.config/formatters/yamlfmt.yml %<CR>", { noremap = true, silent = true })
  end,
})

-- Ansible Language Server
lspconfig.ansiblels.setup({
  capabilities = capabilities,

  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>!yamlfmt -conf ~/.config/formatters/yamlfmt.yml %<CR>", { noremap = true, silent = true })
  end,
})

-- Bash Language Server
lspconfig.bashls.setup({
  capabilities = capabilities,
})

-- Docker Language Servers
lspconfig.dockerls.setup({
  capabilities = capabilities,

  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>!yamlfmt %<CR>", { noremap = true, silent = true })
  end,
})

lspconfig.docker_compose_language_service.setup({
  capabilities = capabilities,
})

-- AWK Language Server
lspconfig.awk_ls.setup({
  capabilities = capabilities,
})

-- Lua Language Server
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT", -- Use LuaJIT for Neovim
      },
      diagnostics = {
        globals = { "vim" }, -- Recognize `vim` as a global variable
      },
      workspace = {
        library = {
          vim.fn.expand("$VIMRUNTIME/lua"), -- Neovim runtime files
          vim.fn.stdpath("config") .. "/lua", -- Your config directory
        },
        checkThirdParty = false, -- Suppress third-party library prompts
      },
      telemetry = {
        enable = false, -- Disable telemetry for privacy
      },
    },
  },
  on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>!stylua %<CR>", { noremap = true, silent = true })
  end,
})

-- Taplo for TOML
lspconfig.taplo.setup({
  capabilities = capabilities,
})

-- clangd Language Server
lspconfig.clangd.setup({
  capabilities = capabilities,
})
