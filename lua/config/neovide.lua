vim.g.neovide_cursor_animation_length = 0.01

-- vim.o.guifont = 'JetBrainsMono Nerd Font:h9'
vim.o.guifont = 'Monaspace Neon:h9'

vim.o.linespace = 12

vim.g.neovide_hide_mouse_when_typing = true

require('lualine').setup({
  options = {
    section_separators   = { left = '', right = '' },
    component_separators = { left = '', right = '' },
  }
})

-- Tabby
local util = require('tabby.util')

local hl_tabline_fill = util.extract_nvim_hl('lualine_c_normal') -- 背景
local hl_tabline = util.extract_nvim_hl('lualine_b_normal')
local hl_tabline_sel = util.extract_nvim_hl('lualine_a_normal') -- 高亮

local function tab_label(tabid, active)
  local icon = active and '' or ''
  local number = vim.api.nvim_tabpage_get_number(tabid)
  local name = util.get_tab_name(tabid)

  local buid = vim.api.nvim_win_get_buf(vim.api.nvim_get_current_win())
  local is_modified = vim.api.nvim_buf_get_option(buid, 'modified')
  local modifiedIcon = is_modified and '' or ''

  return string.format(' %s %d: %s %s', icon, number, name, modifiedIcon)
end

local left_sep_glyph  = ''
local right_sep_glyph = ''

local tabline = {
  hl = 'lualine_c_normal',
  layout = 'tab_only',
  head = {
    { left_sep_glyph, hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    { '  ', hl = { fg = hl_tabline.fg, bg = hl_tabline.bg } },
    { right_sep_glyph, hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
  },
  active_tab = {
    label = function(tabid)
      return {
        tab_label(tabid, true),
        hl = { fg = hl_tabline_sel.fg, bg = hl_tabline_sel.bg, style = 'bold' },
      }
    end,
    left_sep = { left_sep_glyph, hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_fill.bg } },
    right_sep = { right_sep_glyph, hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_fill.bg } },
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
