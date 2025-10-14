--Basic
vim.opt.wildignorecase = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Text settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.linebreak = true

-- UI settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.colorcolumn = '80'
vim.opt.scrolloff = 10

-- Folding
vim.opt.foldmethod = 'syntax'
vim.opt.foldlevel = 99

-- Search settings
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = 'split'

-- Plugins
vim.pack.add({
    {src = "https://github.com/catppuccin/nvim"},
    {src = "https://github.com/neovim/nvim-lspconfig"},
})
--AutoComplete

--LSP
vim.lsp.enable('pyright', 'clangd', 'lua_ls')

-- Colorscheme
vim.cmd.colorscheme "catppuccin"
require("catppuccin").setup({
    transparent_background = true,
})
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Clear Search highlight
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Jump to last known cursor position when reopening a file
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("RestoreCursor", { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)

    -- Skip for commit messages and invalid marks
    if vim.bo.filetype ~= "commit"
      and mark[1] > 0
      and mark[1] <= line_count
    then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
