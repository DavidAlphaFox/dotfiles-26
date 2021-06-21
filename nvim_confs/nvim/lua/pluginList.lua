local packer = require("packer")
local use = packer.use

return packer.startup(
    function()
        use "wbthomason/packer.nvim"

        -- color related stuff
        use "siduck76/nvim-base16.lua"

        use {
            "norcalli/nvim-colorizer.lua",
            event = "BufRead",
            config = function()
                require("colorizer").setup()
            end
        }

        -- lang stuff
        use {
            "nvim-treesitter/nvim-treesitter",
            event = "BufRead",
            config = function()
                require("treesitter-nvim").config()
            end
        }

        use "neovim/nvim-lspconfig"

        -- load compe in insert mode only
        use {
            "hrsh7th/nvim-compe",
            event = "InsertEnter",
            config = function()
                require("compe-completion").config()
            end
        }

        use {
            "onsails/lspkind-nvim",
            event = "BufRead",
            config = function()
                require("lspkind").init()
            end
        }

        use {
            "sbdchd/neoformat",
            cmd = "Neoformat"
        }

        use "nvim-lua/plenary.nvim"
        use "kabouzeid/nvim-lspinstall"

        use {
            "lewis6991/gitsigns.nvim",
            event = "BufRead",
            config = function()
                require("gitsigns-nvim").config()
            end
        }

        use "akinsho/nvim-bufferline.lua"
        use "glepnir/galaxyline.nvim"

        use {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            config = function()
                require("nvim-autopairs").setup()
            end
        }

        use {
            "andymass/vim-matchup",
            event = "CursorMoved"
        }

        use {
            "terrortylor/nvim-comment",
            cmd = "CommentToggle",
            config = function()
                require("nvim_comment").setup()
            end
        }

        -- snippet support
        use {
            "hrsh7th/vim-vsnip",
            event = "InsertCharPre"
        }
        use "rafamadriz/friendly-snippets"

        -- file managing , picker etc
        use {
            "kyazdani42/nvim-tree.lua",
            cmd = "NvimTreeToggle",
            config = function()
                require("nvimTree").config()
            end
        }

        use "kyazdani42/nvim-web-devicons"
        use "nvim-telescope/telescope.nvim"
        use "nvim-telescope/telescope-media-files.nvim"
        use "nvim-lua/popup.nvim"

        -- misc
        use {
            "glepnir/dashboard-nvim",
            cmd = {
                "Telescope live_grep",
                "DashboardNewFile",
                "DashboardJumpMarks"
            },
            setup = function()
                require("dashboard").config()
            end
        }

        use {"tweekmonster/startuptime.vim", cmd="StartupTime"}

        -- load autosave plugin only if its globally enabled
        use {
            "907th/vim-auto-save",
            cond = function()
                return vim.g.auto_save == 1
            end
        }

        use "karb94/neoscroll.nvim"

        use {
            "kdav5758/TrueZen.nvim",
            cmd = {"TZAtaraxis", "TZMinimalist"},
            config = function()
                require("zenmode").config()
            end
        }

        use "folke/which-key.nvim"
        --   use "alvan/vim-closetag" -- for html

        use {
            "lukas-reineke/indent-blankline.nvim",
            branch = "lua",
            event = "BufRead",
            setup = function()
                vim.g.indentLine_enabled = 1
                vim.g.indent_blankline_char = "▏"

                vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
                vim.g.indent_blankline_buftype_exclude = {"terminal"}

                vim.g.indent_blankline_show_trailing_blankline_indent = false
                vim.g.indent_blankline_show_first_indent_level = false
            end
        }
    end,
    {
        display = {
            border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
        }
    }
)
