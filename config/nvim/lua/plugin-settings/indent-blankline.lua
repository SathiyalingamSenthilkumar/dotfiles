local status_ok, ibl = pcall(require, 'ibl')
if not status_ok then
  print("indent-blankline doesn't load!")
  return
end

ibl.setup()
