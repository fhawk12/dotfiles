return {
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", { desc = "lazy" } },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
