return {
  {
    'Civitasv/cmake-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    config = function()
      require('cmake-tools').setup({
        cmake_command = 'cmake',
        cmake_build_directory = 'build',
        cmake_generate_options = { '-DCMAKE_EXPORT_COMPILE_COMMANDS=1' },
        cmake_build_options = {},
        cmake_soft_link_compile_commands = true,  -- Auto-link compile_commands.json
      })
      
      -- Keymaps
      vim.keymap.set('n', '<leader>cg', ':CMakeGenerate<CR>', { desc = 'CMake generate' })
      vim.keymap.set('n', '<leader>cb', ':CMakeBuild<CR>', { desc = 'CMake build' })
      vim.keymap.set('n', '<leader>cr', ':CMakeRun<CR>', { desc = 'CMake run' })
      vim.keymap.set('n', '<leader>cd', ':CMakeDebug<CR>', { desc = 'CMake debug' })
      vim.keymap.set('n', '<leader>cs', ':CMakeSelectBuildType<CR>', { desc = 'Select build type' })
      vim.keymap.set('n', '<leader>ct', ':CMakeSelectBuildTarget<CR>', { desc = 'Select build target' })
    end,
  },
}
