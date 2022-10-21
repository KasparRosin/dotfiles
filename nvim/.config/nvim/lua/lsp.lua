local capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())
local opts = { noremap=true, silent=true }                                      
local servers = {'pyright', 'tsserver', 'phpactor'}

vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
                                                                                
local on_attach = function(client, bufnr)                                       
     vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
     vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
     vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
     vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
     vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
     vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end                                                                             

require("nvim-lsp-installer").setup {
   ensure_installed = servers,
   automatic_installation = true,
}

-- require'lspconfig'.intelephense.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

require'lspconfig'.phpactor.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require'lspconfig'.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require'lspconfig'.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
