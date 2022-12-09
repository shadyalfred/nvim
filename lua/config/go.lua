vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

require('go').setup({
    lsp_inlay_hints = {
        enable = false,
    },
    dap_debug_keymap = false,
    trouble = true
})

vim.keymap.set('n', '<Leader>oi', '<Cmd> GoImport <CR>', { noremap = true, silent = true })
