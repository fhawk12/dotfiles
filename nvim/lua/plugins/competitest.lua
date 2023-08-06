return {
  "xeluxee/competitest.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  keys = {
    { "<leader>;r", "<cmd>CompetiTest run testcases<cr>" },
    { "<leader>;n", "<cmd>CompetiTest receive testcases<cr>" },
    { "<leader>;c", "<cmd>CompetiTest delete_testcase testcases<cr>" },
  },
  config = function()
    require("competitest").setup()
  end,
}
