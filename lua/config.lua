-- Set default clipboard to the system wide clipboard
vim.o.clipboard = 'unnamedplus'
vim.o.pastetoggle = '<Space>p'
vim.keymap.set({'n', 'v'}, '<C-d>', '"_d')

-- Show line's number
vim.wo.number = true

-- Set format options parameters
vim.api.nvim_command('set nocompatible')
vim.api.nvim_command('set formatoptions-=cro')
vim.api.nvim_create_autocmd(
    'FileType',
    {
        pattern = { '*' },
        command = [[set formatoptions-=cro]]
    }
)

-- Highlight current line
vim.wo.cursorline = true

-- Use spaces instead of tab
vim.api.nvim_command('set expandtab')
vim.api.nvim_command('set tabstop=4')
vim.api.nvim_command('set softtabstop=4')
vim.api.nvim_command('set shiftwidth=4')

-- Leader key
vim.g.mapleader = ' '

-- Set hidden
vim.o.hidden = true

-- Set split below and right
vim.o.splitbelow = true
vim.o.splitright = true

-- Fold level
vim.o.foldlevel = 99

-- Highlight yanked text
vim.api.nvim_command('au TextYankPost * silent! lua vim.highlight.on_yank()')

-- Mappings
vim.api.nvim_set_keymap('', '<Leader>w', '<C-w>', { noremap = true })
vim.api.nvim_set_keymap('', '<Leader>wd', '<C-w>c', { noremap = true })

-- Close buffer
vim.keymap.set(
    'n',
    '<Leader>bd',
    function()
        if vim.api.nvim_buf_get_option(0, 'buftype') == 'terminal' then
            vim.api.nvim_buf_delete(0, { force = true })
        else
            require('bufdelete').bufdelete(0, false)
        end
    end,
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap('n', '<Leader>bD', ':bd!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bO', ':%bd|e#|bd#<CR>', { noremap = true, silent = true })

-- Terminal
vim.api.nvim_set_keymap('', '<Leader>oe', ':split term://zsh<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-p>', '<Up>', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-n>', '<Down>', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-l>', '<Right>', { noremap = true })
--

vim.keymap.set({ 'n',  'v' }, 's', '<Plug>Sneak_s', { noremap = true })
vim.keymap.set({ 'n',  'v' }, 'S', '<Plug>Sneak_S', { noremap = true })

vim.api.nvim_set_keymap('n', '<Space>fs', ':w<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>sc', ':nohlsearch<CR>', { noremap = true, silent = true })

-- buffers
vim.keymap.set('n', '[b', '<Cmd>bprevious<CR>')
vim.keymap.set('n', ']b', '<Cmd>bnext<CR>')
-- vim.keymap.set('n', 'gT', '<Cmd>bprevious<CR>')
-- vim.keymap.set('n', 'gt', '<Cmd>bnext<CR>')
vim.keymap.set('n', '<Leader>bp', '<Cmd>bprevious<CR>')
vim.keymap.set('n', '<Leader>bn', '<Cmd>bnext<CR>')

-- dired
vim.keymap.set('n', '<Leader>ff', '<cmd>Dired<cr>', { noremap = true, silent = true })


-- Theme
vim.g.tokyonight_style = 'night'

vim.cmd[[colorscheme tokyonight]]
