local status_ok, fidget = pcall(require, 'fidget')
if not status_ok then
  print("fidget doesn't load!")
  return
end

fidget.setup({

  progress = {
    clear_on_detach = false,        -- Clear notification group when LSP server detaches

    display = {
      skip_history = false,         -- Whether progress notifications should be omitted from history
    },
  },

  notification = {
    override_vim_notify = true,     -- automatically override vim.notify() with fidget
  },

})
