-- Set default clipboard to the system wide clipboard
vim.o.clipboard = 'unnamedplus'
vim.o.pastetoggle = '<Space>p'

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

-- word wrap
vim.wo.wrap      = true
vim.wo.linebreak = true

-- Highlight yanked text
vim.api.nvim_command('au TextYankPost * silent! lua vim.highlight.on_yank()')

-- Mappings
vim.api.nvim_set_keymap('', '<Leader>w', '<C-w>', { noremap = true })
vim.api.nvim_set_keymap('', '<Leader>wd', '<C-w>c', { noremap = true })

-- Toggle wordwarp
vim.keymap.set(
    'n',
    '<Leader>tw',
    function()
        if (vim.wo.wrap and vim.wo.linebreak) then
            vim.wo.wrap      = false
            vim.wo.linebreak = false
        else
            vim.wo.wrap      = true
            vim.wo.linebreak = true
        end
    end
)


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
vim.api.nvim_set_keymap('t', '<A-l>', '<Right>', { noremap = true })
vim.cmd[[ au TermOpen * setlocal nonumber ]]
vim.cmd[[ au TermOpen * setlocal modifiable ]]
vim.cmd[[ au TermOpen * if &buftype ==# 'terminal' | resize 8 | endif ]]

vim.keymap.set(
    'n',
    '<Leader>"',
    function()
        local command = 'alacritty --working-directory ' .. vim.fn.getcwd()
        io.popen(command)
    end
)
--

vim.api.nvim_set_keymap('n', '<Space>fs', ':w<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>sc', ':nohlsearch<CR>', { noremap = true, silent = true })

-- buffers
vim.keymap.set('n', '[b', '<Cmd>bprevious<CR>')
vim.keymap.set('n', ']b', '<Cmd>bnext<CR>')
vim.keymap.set('n', '<Leader>bp', '<Cmd>bprevious<CR>')
vim.keymap.set('n', '<Leader>bn', '<Cmd>bnext<CR>')

-- Theme
vim.cmd[[colorscheme tokyonight]]

-- Font
vim.o.guifont = 'CaskaydiaCove Nerd Font:h10'
