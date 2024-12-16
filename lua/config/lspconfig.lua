local base = require ("plugins.lsp")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require('lspconfig')

lspconfig.typescript.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.tailwindcss.setup({ 
  on_attach = on_attach,
  capabilities = capabilities,
})

