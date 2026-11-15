local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

lualine.setup({
  options = {
    icons_enabled = true,
    always_divide_middle = true,
    globalstatus = true,
  },
  -- branch, diagnostics, diff, encoding, filetype, fileformat, location, mode, progress
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding' },
    lualine_y = { 'diagnostics', 'filetype' },
    lualine_z = { 'location', 'progress' },
  },
  tabline = {},
  extensions = {}
})
