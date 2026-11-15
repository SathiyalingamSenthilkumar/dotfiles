local h = require('helpers')

local cmds = {
  -- Resize windows on terminal resize
  { 'VimResized',   { command = 'wincmd =' } },

  -- Add spellcheck for some files
  { 'FileType',     { pattern = { 'gitcommit', 'markdown' }, callback = function() vim.opt_local.spell = true end } },
}
h.create_autocmds('ToeAutoCmds', cmds)
