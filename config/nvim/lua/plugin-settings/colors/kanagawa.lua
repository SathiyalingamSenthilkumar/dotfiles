local status_ok, kna = pcall(require, 'kanagawa')
if not status_ok then
  print("kanagawa doesn't load!")
  return
end

vim.cmd([[
  color kanagawa
]])
