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
nmap("<leader>gx", "<cmd>Ex<CR>", "Netrw")
