local ok, lsp = pcall(require, "lsp-zero")
if not ok then return end

lsp.preset("recommended")

lsp.ensure_installed({
    'phpactor',
    'tsserver',
    'sumneko_lua',
})

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    float = true,
    update_in_insert = true,
    severity_sort = true,
})

lsp.setup()
