local status_ok, blink = pcall(require, 'blink.cmp')
if not status_ok then
  return
end

blink.setup({
  keymap = {
    ['<Tab>']   = { 'select_next', 'fallback' },
    ['<S-Tab>'] = { 'select_prev', 'fallback' },
    ['<CR>']    = { 'accept', 'fallback' },
  },

  completion = {
    documentation = { auto_show = true },
    menu = {
      border = 'rounded',
      winhighlight = 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None',
    },
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  fuzzy = { implementation = "prefer_rust" },
})
