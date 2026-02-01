-- dap.lua
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",  -- required by dap-ui
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')
      
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
