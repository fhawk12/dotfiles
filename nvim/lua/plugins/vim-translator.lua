return {
  "voldikss/vim-translator",
  keys = {
    {"<leader>t", "<cmd>Translate<cr>"}
  },
  config = function()
    vim.g.translator_default_engines = { "youdao", "bing" }
  end,
}
