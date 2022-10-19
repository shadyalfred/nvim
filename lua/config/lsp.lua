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
  vim.keymap.set('n', '<Leader>j+', vim.lsp.buf.formatting, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- fix gutter width madness
vim.o.signcolumn = 'yes'

local function lsp_symbol(name, icon)
    local hl = "DiagnosticSign" .. name
    vim.fn.sign_define(hl, { text = icon, texthl = hl })
end

lsp_symbol("Error", "")
lsp_symbol("Warn", "")
lsp_symbol("Information", "")
lsp_symbol("Hint", "")

-- Keybindings
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

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
      vim.env.HOME .. '/.config/nvm/versions/node/v18.3.0/bin/emmet-ls',
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
      vim.env.HOME .. '/.config/nvm/versions/node/v18.3.0/bin/typescript-language-server', '--stdio'
    }
})

-- PHP
lspconfig.intelephense.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    globalStoragePath = vim.env.HOME .. '/.cache/nvim'
  },
  cmd = {
    vim.env.HOME .. '/.config/nvm/versions/node/v18.3.0/bin/intelephense', '--stdio'
  }
})

-- Format on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
