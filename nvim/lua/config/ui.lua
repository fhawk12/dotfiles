--------------------------- UI -----------------------------

-- set sign
vim.api.nvim_command("highlight DapBreakpointText guifg=#cd1b0e")
vim.api.nvim_command("highlight DapBreakpointCondition guifg=#cd1b0e")
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpointText", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
)

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint", linehl = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", linehl = "", numhl = "" })

-- 检查是否支持 LSP 和相关的插件
if not vim.diagnostic then
  print("vim.diagnostic not available.")
  return
end

local float_border = {
  {"╭", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╮", "FloatBorder"},
  {"│", "FloatBorder"},
  {"╯", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╰", "FloatBorder"},
  {"│", "FloatBorder"},
}
vim.fn.sign_define("FloatBorder", {linehl="", text=" ", numhl=""})

-- 配置悬浮窗口
vim.diagnostic.config({
  -- 设置在右侧打开悬浮窗口
  float = {
    winblend = 10,  -- 控制悬浮窗口的透明度
    border = float_border,
  },
  virtual_text = false
})
