local status_ok, gb = pcall(require, 'gruvbox')
if not status_ok then
  return
end

-- Gruvbox configuration
vim.g.gruvbox_contrast_dark = 'hard'

vim.cmd([[
  color gruvbox
]])
