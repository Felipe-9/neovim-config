vim.g.mapleader = " " -- Leader key into space
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

-- keymap.set('i', "<leader>jk", "gcc<CR>", { desc = "Exit insert mode with jk" })
-- Move
keymap.set({ "n","x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent= true })
keymap.set({ "n","x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent= true })
keymap.set({ "n","x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent= true })
keymap.set({ "n","x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent= true })
-- Move line or selection
keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", {desc ="move line down"})
keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", {desc ="move line up"})
keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", {desc ="move line down"})
keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", {desc ="move line up"})
keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv'", {desc ="move selection down"})
keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv'", {desc ="move selection up"})
-- Ends with ; or .
keymap.set("i", ";", ";<c-g>u")
keymap.set("i", ".", ".<c-g>u")
-- keymap.set('n', "<leader>/", "gcc<CR>", { desc = "comment out line" })
keymap.set({ 'n',"i" }, "<esc>", "<cmd>nohl<cr><esc>", { desc = "Escape and clear" })
keymap.set('n', "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set('n', "<leader>-", "<C-x>", { desc = "Decrement number" })
-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })                   -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })                 -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })                    -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })               -- close current split window
-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
