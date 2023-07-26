vim.cmd([[packadd packer.nvim]])

require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  })
  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
  })
  use({ "catppuccin/nvim", as = "catppuccin" })
  use({
    "rmagatti/alternate-toggler",
    event = { "BufReadPost" }, -- lazy load after reading a buffer
  })

  use("windwp/nvim-autopairs")
  use("mg979/vim-visual-multi")
  use("tpope/vim-surround")

  use({ "nvim-treesitter/nvim-treesitter", requires = { "nvim-treesitter/nvim-treesitter-textobjects" } })

  use("nvim-lualine/lualine.nvim")

  use("lukas-reineke/indent-blankline.nvim")

  use("wellle/targets.vim")

  use({
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run =
    "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  })

  use("tpope/vim-repeat")

  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")

  use("saadparwaiz1/cmp_luasnip")
  use("L3MON4D3/LuaSnip")

  use("rafamadriz/friendly-snippets")

  use("jose-elias-alvarez/null-ls.nvim")

  use("christoomey/vim-tmux-navigator")

  use({
    'j-hui/fidget.nvim',
    tag = 'legacy',
  })
  use("folke/todo-comments.nvim")

  use("numToStr/Comment.nvim")
end)
