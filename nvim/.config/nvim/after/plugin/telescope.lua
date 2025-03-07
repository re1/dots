require("telescope").load_extension("file_browser")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Telescope find git files" })
vim.keymap.set("n", "<leader>fs", builtin.git_status, { desc = "Telescope find staged files" })
vim.keymap.set("n", "<leader>fl", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

local filebrowser = require("telescope").extensions.file_browser
vim.keymap.set("n", "<leader>fb", filebrowser.file_browser, { desc = "Telescope file browser" })
