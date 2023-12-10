return {
    {
        "folke/tokyonight.nvim",
        conig = function()
            require("tokyonight").setup({
                style = "storm",
                transparent = true,
            })

            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

            vim.cmd.colorscheme("tokyonight")
        end,
    },
}
