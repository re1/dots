require("telescope").load_extension("file_browser")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "ff", builtin.find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "fg", builtin.git_files, { desc = "[F]ind [G]it" })
vim.keymap.set("n", "fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "fl", builtin.live_grep, { desc = "[F]ind [L]ive grep" })
vim.keymap.set("n", "fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
vim.keymap.set("n", "fs", builtin.git_status, { desc = "[F]ind [S]taged" })
vim.keymap.set("n", "ft", builtin.builtin, { desc = "[F]ind [T]elescope" })
vim.keymap.set("n", "fo", builtin.oldfiles, { desc = "[F]ind [O]ld files" })
vim.keymap.set("n", "fw", builtin.grep_string, { desc = "[F]ind [W]ord" })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find buffers" })

local filebrowser = require("telescope").extensions.file_browser
vim.keymap.set("n", "fb", filebrowser.file_browser, { desc = "[F]ile [B]rowser" })
