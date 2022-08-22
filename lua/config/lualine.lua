local function maximize_status()
  return vim.t.maximized and '   ' or ''
end


require('lualine').setup {
  options = {
    component_separators = '',
    section_separators = { left = '', right = '' },
    theme = 'tokyonight'
  },
  sections = {
    lualine_c = { maximize_status, 'filename' }
  }
}
