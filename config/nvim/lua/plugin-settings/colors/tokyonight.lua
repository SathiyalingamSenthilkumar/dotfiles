local status_ok, tn = pcall(require, 'tokyonight')
if not status_ok then
  return
end

vim.cmd([[
  color tokyonight
]])

