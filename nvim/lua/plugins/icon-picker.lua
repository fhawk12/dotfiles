return {
  "ziontee113/icon-picker.nvim",
  dependencies = {
    "stevearc/dressing.nvim",
  },
  keys = {
    { "<leader><leader>i", "<cmd>IconPickerNormal<cr>" },
    { "<leader><leader>y", "<cmd>IconPickerYank<cr>" },
  },
  config = function()
    require("icon-picker").setup({
      disable_legacy_commands = true,
    })
  end,
}
