require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "cpp", "python", "javascript" },

  sync_install = false,

  auto_install = true,

  ignore_install = { "javascript" },


  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}
