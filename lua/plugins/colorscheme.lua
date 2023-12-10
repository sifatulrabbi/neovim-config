require("tokyonight").setup({
    style = "storm",
    transparent = true,
})

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

return {
    {
        "rose-pine/nvim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                variant = "main",
                dark_variant = "main",
                dim_nc_background = false,
                disable_background = true,
                disable_float_background = false,
                disable_italics = false,
            })
        end,
    },
}
