-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function nmap(keymap, action, desc)
    vim.keymap.set("n", keymap, action, { desc = desc, noremap = false })
end

local function vmap(keymap, action, desc)
    vim.keymap.set("v", keymap, action, { desc = desc, noremap = false })
end

-- stylua: ignore start

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
nmap("[d", vim.diagnostic.goto_prev, "Go to previous diagnostic message")
nmap("]d", vim.diagnostic.goto_next, "Go to next diagnostic message")
nmap("<leader>e", vim.diagnostic.open_float, "Open floating diagnostic message")
nmap("<leader>q", vim.diagnostic.setloclist, "Open diagnostics list")

-- Movings a selection
vmap("J", ":m '>+1<CR>gv=gv", "Move HL line up")
vmap("K", ":m '<-2<CR>gv=gv", "Move HL line up")
nmap("J", "mzJ`z", "Unwrap lines")

nmap("<leader>key", "<cmd>Telescope keymaps<CR>", "Show all keymaps")

-- -- harpoon keymaps to override defaults
-- local status, harpoon = pcall(require, "harpoon")
-- if status then
--     nmap("<leader>a", function() harpoon:list():append() end, "Add to harpoon list")
--     nmap("<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "")
--     nmap("<C-y>", function() harpoon:list():select(1) end, "Select 1st file from harpoon")
--     nmap("<C-h>", function() harpoon:list():select(2) end, "Select 2nd file from harpoon")
--     nmap("<C-n>", function() harpoon:list():select(3) end, "Select 3rd file from harpoon")
--     nmap("<C-m>", function() harpoon:list():select(4) end, "Select 4th file from harpoon")
-- end

-- overrides
