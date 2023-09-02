-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    ["]<CR>"] = { ':call append(line("."), "")<CR>', desc = "New line below" },
    ["[<CR>"] = { ':call append(line(".")-1, "")<CR>', desc = "New line above" },

    -- navigate buffer tabs with `Tab` and `Shift + Tab`
    ["<tab>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-tab>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    -- Neoscopes
    ["<Leader>fs"] = {
      function() require("neoscopes").select() end,
      desc = "Find scope",
    },

    -- Git: Fugitive / Bandit
    ["<Leader>gc"] = {
      function() require("bandit").commit() end,
      desc = "Quick commit",
    },

    ["<Leader>gp"] = {
      function() vim.cmd "Git push" end,
      desc = "Git push",
    },

    -- Jest
    ["<leader>jc"] = {
      function() vim.cmd "Coverage" end,
      desc = "Load Code Coverage",
    },

    ["<leader>jt"] = {
      function() vim.cmd "CoverageToggle" end,
      desc = "Toggle Code Coverage",
    },

    ["<leader>jr"] = {
      function() require("neotest").run.run() end,
      desc = "Run test",
    },

    ["<leader>jf"] = {
      function() require("neotest").run.run(vim.fn.expand "%") end,
      desc = "Run test for current file",
    },

    ["<leader>js"] = {
      function() require("neotest").summary.toggle() end,
      desc = "Toggle Test Summary panel",
    },

    ["<leader>jo"] = {
      function() require("neotest").output_panel.toggle() end,
      desc = "Toggle Test Output Panel",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
