local status_ok, gb = pcall(require, 'gruvbox')
if not status_ok then
  print("gruvbox doesn't load!")
  return
end

-- Gruvbox configuration
vim.g.gruvbox_contrast_dark = 'hard'

gb.setup({
    contrast = "hard",
    palette_overrides = {
        dark0_hard = "#1c1c1c",
    },
    overrides = {
        -- Color overides
        String = { fg =  "#99CCFF", italic = true },
        Function = { fg =  "#FFFF66", bold = true },

        -- nvim-tree colors (match ls output colors)
        Directory = { fg = "#3399ff" },
        NvimTreeExecFile = { fg = "#FF3333", bold = true },
        NvimTreeSymlink = { fg = "#FF3399" },
        NvimTreeFolderIcon = { fg = "#C0C0C0", bold = true },
    }
})

vim.cmd([[
  color gruvbox
]])
