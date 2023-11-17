local lspconfig = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<Leader>wL', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<Leader>sr', vim.lsp.buf.rename, bufopts)
  vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<Leader>j+', function() vim.lsp.buf.format({ async = true }) end, bufopts)
  vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- fix gutter width madness
vim.o.signcolumn = 'yes'

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Keybindings
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

-- HTML
lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- CSS
lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- C++
lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- Rust
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- Zig
require'lspconfig'.zls.setup{
  on_attach = on_attach,
  capabilities = capabilities
}

-- C#
lspconfig.csharp_ls.setup{
  on_attach = on_attach,
  capabilities = capabilities
}

-- emmet
lspconfig.emmet_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    vim.env.NVM_BIN .. '/emmet-ls',
    '--stdio'
  }
})

-- golang
lspconfig.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- TypeScript
lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    vim.env.NVM_BIN .. '/typescript-language-server', '--stdio'
  }
})

-- VueJS
lspconfig.vuels.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- PHP
lspconfig.intelephense.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    globalStoragePath = vim.env.HOME .. '/.cache/nvim'
  },
  cmd = {
    vim.env.NVM_BIN .. '/intelephense', '--stdio'
  }
})

-- Format on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
