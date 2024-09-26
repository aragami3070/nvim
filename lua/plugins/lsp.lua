  local navic = require("nvim-navic")
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
  }

  require('lspconfig')['omnisharp'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
  }

  require('lspconfig')['texlab'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
  }

  require('lspconfig')['neocmake'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
  }

  require('lspconfig')['markdown_oxide'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
  }

  require('lspconfig')['lua_ls'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
  }

  require('lspconfig')['ts_ls'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
  }

  require('lspconfig')['cssls'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
  }

  require('lspconfig')['html'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
  }

  require('lspconfig')['asm_lsp'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
  }

  -- require('lspconfig')['typst_lsp'].setup {
  --   capabilities = capabilities,
  --   on_attach = function(client, bufnr)
  --       navic.attach(client, bufnr)
  --   end
  -- }

  require('lspconfig')['svelte'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end

  }

  -- require('lspconfig')['kotlin_language_server'].setup {
  --   capabilities = capabilities
  -- }

  require('lspconfig')['pyright'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
  }

