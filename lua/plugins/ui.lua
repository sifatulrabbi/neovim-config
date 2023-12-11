return {
    {
        "folke/trouble.nvim",
        opts = {
            use_diagnostic_signs = true,
        },
    },

    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
            options = {},
        },
    },

    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                show_buffer_close_icons = false,
                show_close_icon = false,
            },
        },
    },
}
