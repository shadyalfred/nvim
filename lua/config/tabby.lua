vim.o.showtabline = 2

local util = require('tabby.util')

local hl_lualine = util.extract_nvim_hl('lualine_b_normal')
local hl_tabline = util.extract_nvim_hl('TabLine')
local hl_tablinesel = util.extract_nvim_hl('TabLineSel')
local hl_tablinefill = util.extract_nvim_hl('TabLineFill')

local left_sep_glyph = vim.g.neovide and '' or ''
local right_sep_glyph = vim.g.neovide and '' or''

local theme = {
  fill = {
    fg = hl_tablinefill.fg,
    bg = hl_tablinefill.bg
  },
  head = {
    fg = hl_tabline.fg,
    bg = hl_tabline.bg
  },
  head_symbol = {
    fg = hl_lualine.fg,
    bg = hl_lualine.bg
  },
  tab = {
    fg = hl_tabline.fg,
    bg = hl_tabline.bg
  },
  current_tab = {
    fg = hl_tablinesel.fg,
    bg = hl_tablinesel.bg,
    style = 'bold'
  },
  win = {
    fg = hl_tabline.fg,
    bg = hl_tabline.bg
  },
  current_win = {
    fg = hl_tablinefill.fg,
    bg = hl_tablinefill.bg
  },
}

require('tabby.tabline').set(function(line)
  return {
    {
      { left_sep_glyph, hl = theme.head },
      { '  ', hl = theme.head_symbol },
      { right_sep_glyph, hl = theme.head },
    },
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.current_tab or theme.tab

      local has_a_modified_buf = false

      tab.wins().foreach(function(win)
        if win.buf().is_changed() then
          has_a_modified_buf = true
          return
        end
      end)

      return {
        line.sep(
          left_sep_glyph,
          hl,
          theme.fill
        ),
        tab.is_current() and '' or '',
        tab.number(),
        {
          tab.name(),
          hl = hl,
        },
        has_a_modified_buf and '' or '',
        line.sep(
          right_sep_glyph,
          hl,
          theme.fill
        ),
        hl = hl,
        margin = ' ',
      }
    end),
    line.spacer(),
    line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
      return {
        line.sep(left_sep_glyph, theme.win, theme.fill),
        win.buf().is_changed() and '' or '',
        win.buf_name(),
        -- win.file_icon(),
        line.sep(right_sep_glyph, theme.win, theme.fill),
        hl = win.is_current() and theme.current_win or theme.win,
        margin = ' ',
      }
    end),
  }
end)

vim.api.nvim_set_keymap('n', '<Leader>tN', ':$tabnew<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader><Tab>N', ':$tabnew<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>tc', ':tabclose<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>td', ':tabclose<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader><Tab>c', ':tabclose<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader><Tab>d', ':tabclose<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>to', ':tabonly<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>tn', ':tabn<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader><Tab>n', ':tabn<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>tp', ':tabp<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader><Tab>p', ':tabp<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', ']t', ':tabn<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '[t', ':tabp<CR>', { noremap = true })
-- move current tab to previous position
vim.api.nvim_set_keymap('n', '<Leader>tmp', ':-tabmove<CR>', { noremap = true })
-- move current tab to next position
vim.api.nvim_set_keymap('n', '<Leader>tmn', ':+tabmove<CR>', { noremap = true })
-- rename current tab
vim.keymap.set('n', '<Leader>tr', ':TabRename ')
