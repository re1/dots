require'nvim-treesitter.configs'.setup {
  auto_install = true,
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
