return {
  "CRAG666/code_runner.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  keys = {
    { "<leader>rr", "<cmd>RunCode<cr>" }
  },
  config = function()
    require("code_runner").setup({
      -- put here the commands by filetype
      focus = false,
      mode = "term",
      filetype = {
        java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
        python = "python3 -u",
        perl = "perl $fileName",
        typescript = "deno run",
        rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
        cpp = "cd $dir && g++ -g *.cpp -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
        lua = "cd $dir && lua $fileName"
      },
    })
    -- vim.keymap.set("n", "<leader>rr", "<cmd>RunCode<cr>")
    -- vim.keymap.set("n", "<leader>rf", "<cmd>RunFile<cr>")
    -- vim.keymap.set("n", "<leader>rft", "<cmd>RunFile tab<cr>")
    -- vim.keymap.set("n", "<leader>rp", "<cmd>RunProject<cr>")
    -- vim.keymap.set('n', '<leader>rc', '<cmd>RunClose<cr>')
    -- vim.keymap.set('n', '<leader>crf', '<cmd>CRFiletype<cr>')
    -- vim.keymap.set('n', '<leader>crp', '<cmd>CRProjects<cr>')
  end,
}
