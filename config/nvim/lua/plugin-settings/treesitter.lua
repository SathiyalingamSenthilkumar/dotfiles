local status_ok, ts = pcall(require, 'nvim-treesitter')
if not status_ok then
  return
end

-- Install parsers (asynchronous, no-op for already installed parsers)
ts.install({
  'bash',
  'c',
  'cpp',
  'css',
  'dockerfile',
  'html',
  'http',
  'java',
  'javascript',
  'json',
  'json5',
  'llvm',
  'lua',
  'make',
  'markdown',
  'markdown_inline',
  'python',
  'regex',
  'robot',
  'rust',
  'vim',
  'yaml'
})

-- Enable highlighting, folding and indentation for every buffer with a parser
local h = require('helpers')
local cmds = {
  { 'FileType', {
    callback = function(args)
      if not pcall(vim.treesitter.start, args.buf) then
        return
      end

      vim.wo[0][0].foldmethod = 'expr'
      vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  } },
}
h.create_autocmds('ToeTreesitter', cmds)

h.set_options({ foldlevel = 3 })

-- Incremental selection: grow/shrink the visual selection by treesitter node
-- using the builtin 'an'/'in' mappings (replaces visual mode search next/prev)
h.map_keys({
  { 'x', 'n', 'an', { silent = true, remap = true } },
  { 'x', 'N', 'in', { silent = true, remap = true } },
})

-- nvim-treesitter-textobjects
local to_status_ok, textobjects = pcall(require, 'nvim-treesitter-textobjects')
if not to_status_ok then
  return
end

textobjects.setup({
  select = {
    -- Automatically jump forward to textobj
    lookahead = true,
  },
})

local select = require('nvim-treesitter-textobjects.select')
local function sel(query)
  return function() select.select_textobject(query, 'textobjects') end
end

local keys = {
  { { 'x', 'o' }, 'af', sel('@function.outer') },
  { { 'x', 'o' }, 'if', sel('@function.inner') },

  { { 'x', 'o' }, 'ab', sel('@block.outer') },
  { { 'x', 'o' }, 'ib', sel('@block.inner') },

  { { 'x', 'o' }, 'ac', sel('@conditional.outer') },
  { { 'x', 'o' }, 'ic', sel('@conditional.inner') },

  { { 'x', 'o' }, 'al', sel('@loop.outer') },
  { { 'x', 'o' }, 'il', sel('@loop.inner') },
}
h.map_keys(keys)
