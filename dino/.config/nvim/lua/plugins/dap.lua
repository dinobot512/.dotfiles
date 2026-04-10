-- dap.lua
return {
  {
    "mfussenegger/nvim-dap",
    enabled = true,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",  -- required by dap-ui
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')
      
        vim.keymap.set('n', '<F5>',      dap.continue,          { desc = 'DAP: Continue' })
        vim.keymap.set('n', '<F10>',     dap.step_over,         { desc = 'DAP: Step Over' })
        vim.keymap.set('n', '<F11>',     dap.step_into,         { desc = 'DAP: Step Into' })
        vim.keymap.set('n', '<F12>',     dap.step_out,          { desc = 'DAP: Step Out' })
        vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'DAP: Toggle Breakpoint' })
        vim.keymap.set('n', '<leader>dr',dap.repl.open,         { desc = 'DAP: Open REPL' })
      dapui.setup()
      
      -- Auto-open/close UI
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      
      -- Load your dap-config
      require('dap-config')
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = { "codelldb" },  -- C++ debugger
    },
  },
}
