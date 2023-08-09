local status_ok, ft = pcall(require, 'filetype')
if not status_ok then
  return
end

ft.setup({
    overrides = {
        extensions = {
            c = "c",
            h = "c",
            sh = "bash",
            S = "asm",
        },
    },
})

