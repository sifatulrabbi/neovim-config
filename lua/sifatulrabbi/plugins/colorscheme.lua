require("rose-pine").setup({
    variant = "main",
    dark_variant = "main",
    dim_nc_background = false,
    disable_background = true,
    disable_float_background = false,
    disable_italics = true,
})

require("tokyonight").setup({
    variant = "storm",
    styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
    },
})

function ColorMyNvim()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    vim.cmd("colorscheme rose-pine")
end

ColorMyNvim()