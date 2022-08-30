local function maximize_status()
  return vim.t.maximized and '   ' or ''
end


require('lualine').setup {
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_c = { maximize_status, 'filename' }
  }
}
