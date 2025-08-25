return {
  -- {
  --   "williamboman/mason.nvim",
  --   config = function()
  --     require("mason").setup()
  --   end
  -- },
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   config = function()
  --     require("mason-lspconfig").setup({
  --       ensure_installed = { "lua_ls", "ts_ls", "gopls" }
  --     })
  --
  --     local capabilities = vim.lsp.protocol.make_client_capabilities()
  --     local mason_lspconfig = require("mason-lspconfig")
  --
  --     local servers = {
  --       -- ruby_lsp = {
  --       --   cmd_env = { BUNDLE_GEMFILE = vim.fn.getenv('GLOBAL_GEMFILE')},
  --       --   cmd = { 'ruby-lsp' },
  --       --   filetypes = { 'ruby', 'eruby' },
  --       --   root_dir = function()
  --       --     return vim.loop.cwd()
  --       --   end,
  --       -- },
  --       -- sorbet = {},
  --       gopls = {},
  --       lua_ls = {
  --         Lua = {
  --           workspace = { checkThirdParty = false },
  --           telemetry = { enable = false },
  --           diagnostics = { globals = { "vim" } },
  --         },
  --       },
  --     }
  --
  --     mason_lspconfig.setup {
  --       ensure_installed = vim.tbl_keys(servers),
  --     }
  --
  --
  --     -- mason_lspconfig.setup_handlers {
  --     --   function(server_name)
  --     --     require("lspconfig")[server_name].setup {
  --     --       capabilities = capabilities,
  --     --       -- on_attach = on_attach,
  --     --       settings = servers[server_name],
  --     --       filetypes = (servers[server_name] or {}).filetypes,
  --     --     }
  --     --   end
  --     -- }
  --
  --   end
  -- },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      -- lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({})
      -- lspconfig.gopls.setup({})
      -- lspconfig.ruby_lsp.setup({version = "0.5.1"})
      -- lspconfig.sorbet.setup({})

      -- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      -- vim.keymap.set({"n", "v"}, "D", vim.lsp.buf.code_action, {})
      vim.opt.signcolumn = "yes"
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "ruby",
        callback = function()
          vim.lsp.start {
            name = "rubocop",
            cmd = { "bundle", "exec", "rubocop", "--lsp" },
          }
        end,
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.rb",
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end
  }
}
