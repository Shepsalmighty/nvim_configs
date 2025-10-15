return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,

    vim.keymap.set(
        "n", "<leader>e", "<cmd>Oil<CR>",
        { desc = "Open Parent Directory with Oil" }
    )
}
