local dap = require('dap')
local dapui = require('dapui')

-- Adapters
dap.adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command = vim.env.HOME .. '/.config/nvim/libs/vadimcn.vscode-lldb-1.7.4/extension/adapter/codelldb',
    args = {'--port', '${port}'},
  }
}

dap.adapters.coreclr = {
  type = 'executable',
  command = '/usr/bin/netcoredbg',
  args = { '--interpreter=vscode' }
}

  dap.adapters.php = {
    type = 'executable',
    -- command = vim.env.NVM_BIN .. '/node',
    -- args = { vim.env.HOME .. '/.config/nvim/libs/vscode-php-debug/out/phpDebug.js' }
  }
-- C++
dap.configurations.cpp = {
  {
    name = 'Launch file',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
}

-- Rust
dap.configurations.rust = {
  {
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/', 'file')
    end,
    name = 'Rust debug',
    type = 'codelldb',
    request = 'launch',
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
    showDisassembly = 'never'
  },
}

-- C#
local function dotnet_build_project()
  local path = vim.fn.input('Path to your *proj file: ', vim.fn.getcwd(), 'file')
  local cmd = 'dotnet build -c Debug ' .. path .. ' > /dev/null'
  print('')
  print('Cmd to execute: ' .. cmd)
  local f = os.execute(cmd)
  if f == 0 then
    print('\nBuild: ✔️ ')
  else
    print('\nBuild: ❌ (code: ' .. f .. ')')
  end
end

dap.configurations.cs = {
  {
    type = 'coreclr',
    name = 'launch - netcoredbg',
    request = 'launch',
    program = function()
      if vim.fn.confirm('Should I recompile first?', '&yes\n&no', 2) == 1 then
        dotnet_build_project()
      end
      return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/net6.0/', 'file')
    end,
  },
}

-- PHP
dap.configurations.php = {
  {
    name    = 'Listen for Xdebug',
    type    = 'php',
    request = 'launch',
    port    = 9000,
  }
}

-- keymappings
vim.keymap.set(
  'n',
  '<Leader>dd',
  function()
    dapui.toggle()
  end
)

vim.keymap.set(
  'n',
  '<Leader>dc',
  function()
    dap.continue()
  end
)

vim.keymap.set(
'n',
'<Leader>db',
'<cmd> DapToggleBreakpoint<CR>'
)

vim.keymap.set(
'n',
'<Leader>dB',
'<cmd> DapBreakpointCondition<CR>'
)

vim.keymap.set(
'n',
'<Leader>dc',
'<cmd> DapContinue<CR>'
)

vim.keymap.set(
'n',
'<Leader>di',
'<cmd> DapStepInto<CR>'
)

vim.keymap.set(
'n',
'<Leader>do',
'<cmd> DapStepOver<CR>'
)

vim.keymap.set(
'n',
'<Leader>dO',
'<cmd> DapStepOut<CR>'
)

vim.keymap.set(
'n',
'<F5>',
'<cmd> DapContinue<CR>'
)

vim.keymap.set(
'n',
'<F1>',
'<cmd> DapStepOver<CR>'
)

vim.keymap.set(
'n',
'<F2>',
'<cmd> DapStepInto<CR>'
)

vim.keymap.set(
'n',
'<F3>',
'<cmd> DapStepOut<CR>'
)

-- dapui setup
dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  expand_lines = vim.fn.has("nvim-0.7"),
  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        { id = "watches", size = 0.30 },
        { id = "scopes", size = 0.25 },
        { id = "stacks", size = 0.25 },
        "breakpoints",
      },
      size = 40, -- 40 columns
      position = "right",
    },
    {
      elements = {
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
  }
})

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Theme
vim.api.nvim_set_hl(0, 'DapBreakpoint',     { fg='#AAAAFF' })
vim.api.nvim_set_hl(0, 'DapBreakpointLine', { bg='#222244' })
vim.api.nvim_set_hl(0, 'DapStopped',        { fg='#228822' })
vim.api.nvim_set_hl(0, 'DapStoppedLine',    { bg='#224422' })

vim.fn.sign_define('DapBreakpoint',          { text='', texthl='DapBreakpoint', linehl='DapBreakpointLine', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', linehl='DapBreakpointLine', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected',  { text='', texthl='DapBreakpoint', linehl='DapBreakpointLine', numhl= 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint',            { text='', texthl='DapLogPoint', linehl='DapLogPointLine', numhl= 'DapLogPoint' })
vim.fn.sign_define('DapStopped',             { text='', texthl='DapStopped', linehl='DapStoppedLine', numhl= 'DapStopped' })

