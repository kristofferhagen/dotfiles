local treesitter = require'nvim-treesitter'

local languages = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "go", "gotmpl", "css", "csv", "html", "javascript", "xml", "scss", "regex", "ini", "json" }

treesitter.install(languages)

vim.api.nvim_create_autocmd('FileType', {
  pattern = languages,
  callback = function() vim.treesitter.start() end,
})
