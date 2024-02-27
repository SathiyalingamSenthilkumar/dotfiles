local status_ok, mason = pcall(require, 'mason')
if not status_ok then
  print("mason doesn't load!")
  return
end

mason.setup()
