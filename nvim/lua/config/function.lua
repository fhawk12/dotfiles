------ toggle bool ------
function ToggleBoolean()
  local word = vim.fn.expand("<cword>")
  if is_bool(word) then
    local res = not to_bool(word)
    vim.cmd("normal! ciw" .. tostring(res))
  end
end

function is_bool(str)
  return str == "true" or str == "false"
end

function to_bool(str)
  return str == "true"
end

------ jump stack trace -------
local preview_stack_trace = function()
	local line = vim.api.nvim_get_current_line()
	local pattern = "([^:]+):(%d+):(%d+)"
	local filepath, line_nr, column_nr = string.match(line, pattern)
	if filepath and line_nr and column_nr then
		vim.cmd(":wincmd k")
		vim.cmd("e " .. filepath)
		vim.api.nvim_win_set_cursor(0, { tonumber(line_nr), tonumber(column_nr) })
		vim.cmd(":wincmd j")
	end
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "crunner_*",
	callback = function()
		vim.keymap.set("n", "p", preview_stack_trace, { silent = true, noremap = true, buffer = true })
	end,
})

------ close all buf except current ------
function close_all_buffers_except_current()
  local current_bufnr = vim.fn.bufnr('%')
  local buflist = vim.fn.getbufinfo({buflisted = 1})

  for _,buf in ipairs(buflist) do
    if buf.bufnr ~= current_bufnr then
      vim.cmd('bd' .. buf.bufnr)
    end
  end
end

vim.cmd("command! -nargs=0 Bda lua vim.fn.close_all_buffers_except_current()")
vim.fn["close_all_buffers_except_current"] = close_all_buffers_except_current
