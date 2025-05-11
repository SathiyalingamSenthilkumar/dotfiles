local status_ok, comment = pcall(require, 'Comment')
if not status_ok then
  return
end

comment.setup({
  padding = true, -- Add a space between comment and line
  sticky = true, -- Cursor retains it's place
  ignore = nil, -- Lines to be ignored while commenting

  mappings = {
    basic = true,
    extra = false,
    extended = false,
  },

  toggler = {
    line = '<Leader>cl',
    block = '<Leader>cb',
  },

  opleader = {
    line = '<Leader>cl',
    block = '<Leader>cb',
  }
})
