local h = require('helpers')

local cmds = {
  -- Resize windows on terminal resize
  { 'VimResized',   { command = 'wincmd =' } },

  -- Add spellcheck for some files
  -- TODO: Figure out how to do setlocal in LUA
  { 'FileType',     { pattern = { 'gitcommit', 'markdown' }, command = 'setlocal spell' } },
}
h.create_autocmds('ToeAutoCmds', cmds)
