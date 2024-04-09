local function maximize_status()
  return vim.t.maximized and '   ' or ''
end

local left_sec_sep_glyph = ''
local right_sec_sep_glyph = ''
local left_comp_sep_glyph = ''
local right_comp_sep_glyph = ''

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
