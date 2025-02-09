-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

--remove padding in alacritty
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
