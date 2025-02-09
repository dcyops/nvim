-- lua/plugins_conf/lsp.lua

-- Mason configuration
require("mason").setup({
  ui = {
    border = "rounded"
  },
})

-- Mason-lspconfig configuration
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "html" },
  automatic_installation = false,
})

-- LSP configuration
local lspconfig = require('lspconfig')
local cmp = require('cmp')

-- capabilities have to be defined this way for some reason
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.clangd.setup {
  capabilities = capabilities,
  cmd = { "/usr/bin/clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp", "h" }
}
lspconfig.lua_ls.setup {
  capabilities = capabilities
}
lspconfig.html.setup {
  capabilities = capabilities
}
lspconfig.cssls.setup {
  capabilities = capabilities
}

-- nvim-cmp setup
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        require("luasnip").expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        require("luasnip").jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = {
    { name = "luasnip", keyword_length = 2 },
    { name = "nvim_lsp" },
    { name = "buffer", keyword_length = 3 },
    { name = "path" },
  },
})
