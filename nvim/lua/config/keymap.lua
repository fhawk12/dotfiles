local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "

map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- buffer movement
map("n", "H", "<cmd>bprevious<CR>")
map("n", "L", "<cmd>bnext<CR>")

-- cursor movement
map({ "n", "v" }, "J", "5j")
map({ "n", "v" }, "K", "5k")
map({ "n", "v" }, "W", "5w")

map("i", "<C-n>", "<Nop>", { noremap = true })
map("i", "<C-p>", "<Nop>", { noremap = true })
map("i", "<C-y>", "<Nop>", { noremap = true })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

map({ "n", "v" }, "<leader>fm", "<cmd>lua vim.lsp.buf.format()<cr>") -- format
map({ "n", "v" }, "<c-a>", "ggVG")                                   -- select all
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>")              -- save file
map("n", "<esc>", "<cmd>noh<cr>")                                    -- cancel highlight
map("n", "<leader>q", "<cmd>bd<cr>")                                 -- close buf
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>")          -- rename
map("n", "<leader>i", "<cmd>lua ToggleBoolean()<cr>")                -- toggle bool
map("n", "<leader>h", "<cmd>lua vim.diagnostic.open_float()<cr>")    -- show diagnostic info

-- lsp
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
    local opts = { buffer = ev.buf }
    map("n", "<leader>k", vim.lsp.buf.hover, opts)
    map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    map("n", "<space>rn", vim.lsp.buf.rename, opts)
    map({ "n", "v" }, "ca", vim.lsp.buf.code_action, opts)
  end,
})