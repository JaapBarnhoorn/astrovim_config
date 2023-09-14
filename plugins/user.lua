local colors = require("catppuccin.palettes").get_palette()

return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    event = "User AstroFile",
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "macchiato",
      integrations = { neotest = true },
      transparent_background = true,
    },
  },
  {
    "mskelton/bandit.nvim",
  },
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
    keys = {
      { "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
      { "<leader>hr", "<cmd>lua require('harpoon.mark').rm_file()<cr>", desc = "Unmark file with harpoon" },
      { "<leader>ht", "<cmd>lua require('harpoon.mark').toggle_file()<cr>", desc = "Toggle mark file with harpoon" },
      { "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
      { "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Go to previous harpoon mark" },
      { "<leader>ha", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
    },
  },
  {
    "andythigpen/nvim-coverage",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      signs = {
        covered = { priority = 100 }, -- use a higher value than diagnostics or gitsigns
        uncovered = { priority = 100 },
      },
      highlights = {
        -- customize highlight groups created by the plugin
        covered = { fg = colors.base }, -- supports style, fg, bg, sp (see :h highlight-gui)
        uncovered = { fg = colors.rosewater },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    ft = { "javascript", "typescript", "typescriptreact" },
    dependencies = {
      "JaapBarnhoorn/neotest-jest",
      {
        "folke/neodev.nvim",
        opts = function(_, opts)
          opts.library = opts.library or {}
          if opts.library.plugins ~= true then
            opts.library.plugins = require("astronvim.utils").list_insert_unique(opts.library.plugins, "neotest")
          end
          opts.library.types = true
        end,
      },
    },
    opts = function()
      return {
        adapters = {
          require "neotest-jest" {
            jestCommand = "npx stencil test --spec",
            env = { CI = true },
            cwd = function(path) return vim.fn.getcwd() end,
          },
        },
      }
    end,
    config = function(_, opts)
      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace "neotest"
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
      require("neotest").setup(opts)
    end,
  },
}
