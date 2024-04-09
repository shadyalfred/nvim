local function maximize_status()
  return vim.t.maximized and '   ' or ''
end

local left_sec_sep_glyph   = vim.g.neovide and '' or ''
local right_sec_sep_glyph  = vim.g.neovide and '' or ''
local left_comp_sep_glyph  = vim.g.neovide and '' or ''
local right_comp_sep_glyph = vim.g.neovide and '' or ''

require('lualine').setup {
  options = {
    section_separators = { left = left_sec_sep_glyph, right = right_sec_sep_glyph },
    component_separators = { left = left_comp_sep_glyph, right = right_comp_sep_glyph },
    globalstatus = true,
  },
  sections = {
    lualine_c = { maximize_status }
  }
}
