local flash = require('flash')

vim.keymap.set(
  {'n', 'x', 'o'},
  's',
  function()
    flash.jump({
      search = { forward = true, wrap = false, multi_window = false },
    })
  end
)

vim.keymap.set(
  {'n', 'x', 'o'},
  'S',
  function()
    flash.jump({
      search = { forward = false, wrap = false, multi_window = false },
    })
  end
)

vim.keymap.set(
  {'n', 'x', 'o'},
  'gsj',
  function()
    flash.jump({
      search = { mode = 'search', max_length = 0, forward = true, wrap = false, multi_window = false },
      pattern = '^'
    })
  end
)

vim.keymap.set(
  {'n', 'x', 'o'},
  'gsk',
  function()
    flash.jump({
      search = { mode = 'search', max_length = 0, forward = false, wrap = false, multi_window = false },
      pattern = '^'
    })
  end
)
