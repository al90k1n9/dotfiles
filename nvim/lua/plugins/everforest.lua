return {
  {
    "neanias/everforest-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup({
        -- your config here, e.g. background = "hard"
        background = "hard",
      })
      vim.cmd.colorscheme("everforest")
    end,
  },
}

