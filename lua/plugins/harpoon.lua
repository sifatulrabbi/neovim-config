return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup({})

        -- stylua: ignore
        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Add to harpoon list" })
        -- stylua: ignore
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        -- stylua: ignore
        vim.keymap.set("n", "<C-y>", function() harpoon:list():select(1) end)
        -- stylua: ignore
        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(2) end)
        -- stylua: ignore
        vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
        -- stylua: ignore
        vim.keymap.set("n", "<C-m>", function() harpoon:list():select(4) end)
    end,
}
