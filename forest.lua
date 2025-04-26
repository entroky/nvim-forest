return {
    {
    "phijor/forester.nvim",
    branch = "completion-enhancements",
    requires = {
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },

        config = function()
            vim.g.mapleader = " "

            vim.keymap.set(
                "n",
                "<leader>n.",
                "<cmd>Forester browse<CR>",
                { silent = true }
            )
            vim.keymap.set(
                "n",
                "<leader>nn",
                "<cmd>Forester new<CR>",
                { silent = true }
            )
            vim.keymap.set(
                "n",
                "<leader>nr",
                "<cmd>Forester new_random<CR>",
                { silent = true }
            )
            vim.keymap.set(
                "i",
                "<C-t>",
                "<cmd>Forester transclude_new<CR>",
                { silent = true }
            )
            vim.keymap.set(
                "i",
                "<C-l>",
                "<cmd>Forester link_new<CR>",
                { silent = true }
            )

            -- local foresterCompletionSource = require("forester.completion")

            -- require("cmp").register_source("forester", foresterCompletionSource)
            -- require("cmp").setup.filetype(
            --     "tree",
            --     { sources = { { name = "forester", dup = 0 } } }
            -- )
            require("forester").setup()
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            local parser_config =
                require("nvim-treesitter.parsers").get_parser_configs()

            parser_config.forester = {
                install_info = {
                    url = "~/tree-sitter-forester",
                    files = { "src/parser.c" },
                    branch = "main",
                    generate_requires_npm = false,
                    requires_generate_from_grammar = false,
                },
                filetype = "tree",
            }

            require("nvim-treesitter.configs").setup({
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },

                ensure_installed = { "forester" },
            })
        end,
    },
}
