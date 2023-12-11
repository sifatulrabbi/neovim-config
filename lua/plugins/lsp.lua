return {
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            servers = {
                pyright = {},
                gopls = {},
                jsonls = {},
                yamlls = {},
                cssls = {},
                tailwindcss = {},
                volar = {},
                clangd = {},
                eslint = {},
            },
        },
    },

    -- add tsserver and setup with typescript.nvim instead of lspconfig
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "jose-elias-alvarez/typescript.nvim",
            init = function() end,
        },
        ---@class PluginLspOpts
        opts = {
            servers = {
                -- tsserver will be automatically installed with mason and loaded with lspconfig
                tsserver = {},
            },
            -- you can do any additional lsp server setup here
            -- return true if you don't want this server to be setup with lspconfig
            ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
            setup = {
                -- example to setup with typescript.nvim
                tsserver = function(_, opts)
                    require("typescript").setup({ server = opts })
                    return true
                end,
                -- Specify * to use this function as a fallback for any server
                -- ["*"] = function(server, opts) end,
            },
        },
    },

    -- add any tools you want to have installed below
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "stylua",
                "shellcheck",
                "shfmt",
                "black",
                "goimports",
                "gofumpt",
                "delve",
                "djlint",
                "prettier",
            },
        },
    },
}
