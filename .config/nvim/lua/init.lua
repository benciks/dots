require("oil").setup()

local lspconfig = require'lspconfig'
local lspformat = require'lsp-format'

local on_attach = function(client, bufnr)
  lspformat.on_attach(client, bufnr)
end

lspformat.setup {}
lspconfig.tsserver.setup {}
lspconfig.svelte.setup {}
lspconfig.volar.setup {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
  init_options = {
    typescript = {
      tsdk = '/opt/homebrew/lib/node_modules/typescript/lib',
    }
  }
}
lspconfig.templ.setup {
  on_attach = on_attach,
}
lspconfig.gopls.setup {
  on_attach = on_attach,
}
lspconfig.clangd.setup {}

-- TODO: Configure this with the autocomplete plugin
lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = { 'html', 'svelte', 'vue' }
})

require'nvim-treesitter.configs'.setup {
    auto_install = true,
    highlight = {
        enable = true,
    }
}

local configs = require'lspconfig/configs'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

