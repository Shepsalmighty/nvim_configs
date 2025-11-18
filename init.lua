vim.o.number = true
vim.o.relativenumber = false

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.ignorecase = true
vim.o.clipboard = "unnamedplus"
vim.o.undofile = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set(
    "n", "<C-h>", "<C-w><C-h>",
    { desc = "Move focus to the left window" }
)

vim.keymap.set(
    "n", "<C-l>", "<C-w><C-l>",
    { desc = "Move focus to the right window" }
)

vim.keymap.set(
    "n", "<C-j>", "<C-w><C-j>",
    { desc = "Move focus to the lower window" }
)

vim.keymap.set(
    "n", "<C-k>", "<C-w><C-k>",
    { desc = "Move focus to the upper window" }
)

require("config.lazy")
