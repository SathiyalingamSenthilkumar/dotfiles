local status_ok, cpn = pcall(require, 'catppuccin')
if not status_ok then
  print("catppuccin doesn't load!")
  return
end

vim.cmd([[
  color catppuccin
]])
