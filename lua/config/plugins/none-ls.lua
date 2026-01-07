return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        local fs = vim.loop.fs_stat -- check if a file exists

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,

                null_ls.builtins.formatting.clang_format.with({
                    extra_args = {
                        "-style={BasedOnStyle: LLVM, IndentWidth: 4, BreakBeforeBraces: Allman, PointerAlignment: Right}"
                    },
                    condition = function()
                        return not fs(".clang-format")
                    end,
                }),
            }
        })

        vim.keymap.set(
            "n", "<leader>gf", vim.lsp.buf.format,
            { desc = "Format File" }
        )
    end,
}
