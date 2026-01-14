return {
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      -- local actions = require("telescope.actions")
      local file_ignore_patterns = {
        "sorbet/",
        "/public/",
        "vendor/",
        "config/analysis/wn_s.pl"
      }

      vim.keymap.set("n", "<C-p>", function()
        builtin.find_files({
          file_ignore_patterns = file_ignore_patterns
        })
      end, {})
      vim.keymap.set("n", "<C-f>", function()
        builtin.live_grep({
          file_ignore_patterns = file_ignore_patterns
        })
      end, {})
      vim.keymap.set("n", "<C-d>", function()
        builtin.resume({
          file_ignore_patterns = file_ignore_patterns
        })
      end, {})
      vim.keymap.set("n", "<C-a>", function()
        builtin.grep_string({
          file_ignore_patterns = file_ignore_patterns
        })
      end, {})
      vim.keymap.set("n", "<C-s>", function()
        builtin.buffers({
          file_ignore_patterns = file_ignore_patterns
        })
      end, {})

      -- vim.keymap.set("n", "<C-d>", function()
      --   actions.cycle_history_next()
      -- end, {})
    end
  },
  -- {
  --   "nvim-telescope/telescope-ui-select.nvim",
  --   config = function()
  --     -- This is your opts table
  --     require("telescope").setup {
  --       defaults = {
  --         preview = {
  --           filesize_limit = 1, -- Sets limit to 1MB
  --         },
  --       },
  --       extensions = {
  --         ["ui-select"] = {
  --           require("telescope.themes").get_dropdown {
  --             -- even more opts
  --           }
  --
  --           -- pseudo code / specification for writing custom displays, like the one
  --           -- for "codeactions"
  --           -- specific_opts = {
  --           --   [kind] = {
  --           --     make_indexed = function(items) -> indexed_items, width,
  --           --     make_displayer = function(widths) -> displayer
  --           --     make_display = function(displayer) -> function(e)
  --           --     make_ordinal = function(e) -> string
  --           --   },
  --           --   -- for example to disable the custom builtin "codeactions" display
  --           --      do the following
  --           --   codeactions = false,
  --           -- }
  --         },
  --         fzf = {
  --           fuzzy = true,                    -- false will only do exact matching
  --           override_generic_sorter = true,  -- override the generic sorter
  --           override_file_sorter = true,     -- override the file sorter
  --           case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
  --                                            -- the default case_mode is "smart_case"
  --         }
  --       }
  --     }
  --     -- To get ui-select loaded and working with telescope, you need to call
  --     -- load_extension, somewhere after setup function:
  --     require("telescope").load_extension("ui-select")
  --     require('telescope').load_extension('fzf')
  --   end
  -- }
}
