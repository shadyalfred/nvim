local rt = require('rust-tools')

local extension_path = vim.env.HOME .. '/.config/nvim/libs/vadimcn.vscode-lldb-1.7.4/extension/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

rt.setup({
  tools = {
    inlay_hints = {
      auto = false,
    },
  },
  server = {
    on_attach = function(_, bufnr)
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
      vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
      vim.keymap.set('n', '<Leader>wL', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, bufopts)
      vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set('n', '<Leader>sr', vim.lsp.buf.rename, bufopts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      vim.keymap.set('n', '<Leader>j+', function() vim.lsp.buf.format { async = true } end, bufopts)
			vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, bufopts)

      -- Hover actions
      vim.keymap.set({ 'v', 'n' }, 'K', rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set({ 'v', 'n' }, '<Leader>ca', rt.code_action_group.code_action_group, { buffer = bufnr })

      vim.keymap.set({ 'n', 'v' }, '<M-k>', '<Cmd> RustMoveItemUp<CR>')
      vim.keymap.set({ 'n', 'v' }, '<M-j>', '<Cmd> RustMoveItemDown<CR>')
    end,
    capabilities = capabilities
  },
  dap = {
    adapter = require('rust-tools.dap').get_codelldb_adapter(
      vim.env.CODELLDB_PATH .. '/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb',
      vim.env.CODELLDB_PATH .. '/share/vscode/extensions/vadimcn.vscode-lldb/lldb/lib/liblldb.so'
    )
  }
})

rt.inlay_hints.disable()
