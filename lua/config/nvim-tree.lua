vim.api.nvim_set_keymap('n', '<Space>op', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

require('nvim-tree').setup {
    hijack_netrw = false,
    sync_root_with_cwd = true,
    view = {
        side = 'right'
    }
}
