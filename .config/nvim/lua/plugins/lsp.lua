
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "tsserver", "ruby_lsp", "sorbet" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      -- lspconfig.ruby_lsp.setup({})
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
