local status_ok, tn = pcall(require, 'tokyonight')
if not status_ok then
  print("tokyonight doesn't load!")
  return
end

vim.cmd([[
  color tokyonight
]])

