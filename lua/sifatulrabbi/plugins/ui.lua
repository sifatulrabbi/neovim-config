-- document existing key chains
require("which-key").register({
    ["<leader>f"] = { name = "[F]ind", _ = "which_key_ignore" },
})

-- See `:help gitsigns.txt`
require("gitsigns").setup({
    signs = {
        add = { text = "+" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
    },
    on_attach = function(bufnr)
        vim.keymap.set(
            "n",
            "<leader>hp",
            require("gitsigns").preview_hunk,
            { buffer = bufnr, desc = "Preview git hunk" }
        )

        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({ "n", "v" }, "]c", function()
            if vim.wo.diff then
                return "]c"
            end
            vim.schedule(function()
                gs.next_hunk()
            end)
            return "<Ignore>"
        end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
        vim.keymap.set({ "n", "v" }, "[c", function()
            if vim.wo.diff then
                return "[c"
            end
            vim.schedule(function()
                gs.prev_hunk()
            end)
            return "<Ignore>"
        end, {
            expr = true,
            buffer = bufnr,
            desc = "Jump to previous hunk",
        })
    end,
})

require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = "|",
        section_separators = "",
        globalstatus = true,
    },
    sections = {
        lualine_c = {
            { "filename", path = 1 },
        },
    },
})

local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}
local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup({ scope = { highlight = highlight } })
hooks.register(
    hooks.type.SCOPE_HIGHLIGHT,
    hooks.builtin.scope_highlight_from_extmark
)

require("zen-mode").setup({
    window = {
        width = 120,
        height = 1,
        options = {
            wrap = false,
        },
    },
})

require("neo-tree").setup({
    filesystem = {
        filtered_items = {
            hide_files = false,
            hide_dotfiles = false,
            visible = true,
            never_show = {
                ".git",
            },
        },
    },
})
