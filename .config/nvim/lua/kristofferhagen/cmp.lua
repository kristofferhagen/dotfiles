-- Subscribe to this issue for updates on breaking changes:
-- https://github.com/hrsh7th/nvim-cmp/issues/231

local cmp = require'cmp'

cmp.setup({
  enabled = true,

  autocomplete = {
    2, -- Trigger completion when there are 2 or more characters
  },

  preselect = cmp.PreselectMode.Item,  -- 'enable'
  throttle_time = 80,  -- milliseconds
  source_timeout = 200,  -- milliseconds
  resolve_timeout = 800,  -- milliseconds
  incomplete_delay = 400,  -- milliseconds

  formatting = {
    format = function(entry, vim_item)
      vim_item.abbr = string.sub(vim_item.abbr, 1, 100)  -- Max abbr width
      vim_item.kind = string.sub(vim_item.kind, 1, 100)  -- Max kind width
      return vim_item
    end,
  },

  -- window = {
  --   completion = cmp.config.window.bordered(),
  --   documentation = cmp.config.window.bordered(),
  -- },

  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),

  sources = {
    -- { name = 'path' },
    -- { name = 'buffer' },
    -- { name = 'calc' },
    { name = 'nvim_lsp' },
    -- { name = 'nvim_lua' },
    -- { name = 'vsnip' },
    -- { name = 'ultisnips' },
    -- { name = 'luasnip' },
    -- { name = 'emoji' },
  },
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path', dup = 0 }
  }, {
    { name = 'cmdline', dup = 0 }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config('gopls', {
  capabilities = capabilities
})
