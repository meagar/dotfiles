require("config.lazy")

vim.api.nvim_set_hl(0, "DumbSpellingMistakes", {
  fg = "Black",      -- text color
  bg = "Yellow",     -- background highlight
  bold = true,
})

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    vim.fn.matchadd("DumbSpellingMistakes", [[\v(feautre)]])
  end,
})

vim.opt.modeline = false
vim.opt.modelines = 0

vim.api.nvim_create_user_command('CopyRelPath', function()
  local path = vim.fn.expand('%')
  vim.fn.setreg('+', path)
end, {})

-- Trim trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rb",
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

-- Show diagnostic floating window after stopping on a warning
vim.o.updatetime = 250  -- Reduce delay before CursorHold triggers (default is 4000ms)
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end
})

-- Per https://github.com/swaits/zellij-nav.nvim
vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*",
    command = "silent !zellij action switch-mode normal"
})

-- Treat .thor files like Ruby
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.thor",
  command = "set filetype=ruby"
})

-- Treat .hamlbars files like haml
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.hamlbars",
  command = "set filetype=haml"
})

vim.cmd("set spell")
vim.cmd("set ignorecase") -- required before smartcase
vim.cmd("set smartcase")
vim.cmd("set number")
vim.cmd("set relativenumber")

-- Soft tabs
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Higlight the 120th column
vim.cmd("set colorcolumn=120")
vim.cmd("highlight ColorColumn guibg=#191923")

-- Yank to the system clipboard
vim.cmd("set clipboard+=unnamedplus")

-- set file type on buffer creation and reading
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.slim" },
  command = "set ft=slim",
})

-- Code folding based on indentation
vim.cmd("set foldmethod=indent")

-- vim.opt.autoindent = true             -- Indent: Copy indent from current line when starting new line
-- vim.opt.colorcolumn = "120"           -- Show vertical bar to indicate 120 chars
-- vim.opt.cursorline = true             -- Highlight the cursor line
-- vim.opt.expandtab = true              -- Use spaces to insert a tab
-- vim.opt.fillchars = "eob: "           -- Hide ~ in line number column after end of buffer
--
--
vim.opt.grepprg = "rg --vimgrep"      -- Use ripgrep for file search
vim.opt.laststatus = 2                -- Always show status line
vim.opt.list = true                   -- Show tabs and trailing whitespace
vim.opt.listchars = "tab:>-,trail:·"  -- Set chars to show for tabs or trailing whitespace
vim.opt.linebreak = true
-- vim.opt.scrolloff = 10                -- Show next few lines when searching text
-- vim.opt.shiftround = true             -- Indentation: When at 3 spaces, >> takes to 4, not 5
-- vim.opt.shiftwidth = 2                -- Tab settings - Use 2 spaces for each indent level
-- vim.opt.splitbelow = true
-- vim.opt.splitright = true
-- vim.opt.updatetime = 200              -- Reduce updatetime
-- vim.opt.wildmode = "list:full"        -- Completion mode: list all matches
--
-- -- Line numbers: Show current line, but use relative numbers elsewhere
-- vim.opt.number = true
-- vim.opt.relativenumber = true
--
-- -- Search
-- vim.opt.hlsearch = true               -- Highlight results
-- vim.opt.incsearch = true              -- Show results as you type
-- vim.opt.ignorecase = true             -- Ignore case
-- vim.opt.smartcase = true              -- unless uppercase chars are given
