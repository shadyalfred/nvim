vim.g.vimwiki_list = {{
    path = vim.env.HOME .. '/HDD/Obsidian',
    syntax = 'markdown',
    ext = '.md'
}}

vim.g.vimwiki_global_ext = 0

vim.g.vimwiki_key_mappings = { all_maps = 0 }

vim.keymap.set('n', '<Leader>ww', '<Plug>VimwikiIndex', { noremap = true, silent = true })
