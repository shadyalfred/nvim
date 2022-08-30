local util = require('tabby.util')

local hl_tabline_fill = util.extract_nvim_hl('lualine_c_normal') -- 背景
local hl_tabline = util.extract_nvim_hl('lualine_b_normal')
local hl_tabline_sel = util.extract_nvim_hl('lualine_a_normal') -- 高亮

local function tab_label(tabid, active)
  local icon = active and '' or ''
  local number = vim.api.nvim_tabpage_get_number(tabid)
  local name = util.get_tab_name(tabid)
  return string.format(' %s %d: %s ', icon, number, name)
end

local tabline = {
  hl = 'lualine_c_normal',
  layout = 'tab_only',
  head = {
    { '', hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    { '  ', hl = { fg = hl_tabline.fg, bg = hl_tabline.bg } },
    { '', hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
  },
  active_tab = {
    label = function(tabid)
      return {
        tab_label(tabid, true),
        hl = { fg = hl_tabline_sel.fg, bg = hl_tabline_sel.bg, style = 'bold' },
      }
    end,
    left_sep = { '', hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_fill.bg } },
    right_sep = { '', hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_fill.bg } },
  },
  inactive_tab = {
    label = function(tabid)
      return {
        tab_label(tabid, false),
        hl = { fg = hl_tabline.fg, bg = hl_tabline_fill.bg },
      }
    end,
    left_sep = { '', hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    right_sep = { '', hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
  },
}

require('tabby').setup({
  tabline = tabline
})

vim.api.nvim_set_keymap('n', '<Leader>tN', ':$tabnew<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>tc', ':tabclose<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>to', ':tabonly<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>tn', ':tabn<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>tp', ':tabp<CR>', { noremap = true })
-- move current tab to previous position
vim.api.nvim_set_keymap('n', '<Leader>tmp', ':-tabmove<CR>', { noremap = true })
-- move current tab to next position
vim.api.nvim_set_keymap('n', '<Leader>tmn', ':+tabmove<CR>', { noremap = true })
-- rename current tab
vim.keymap.set('n', '<Leader>tr', ':TabRename ')
