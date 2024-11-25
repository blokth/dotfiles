return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },

  {
    "stevearc/oil.nvim",
    keys = {
      { "<leader>e", "<cmd>Oil<cr>", desc = "Explorer" },
    },
    opts = {
      default_file_explorer = true,
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
