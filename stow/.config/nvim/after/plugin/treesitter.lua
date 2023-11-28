local ok, treesitter= pcall(require, 'nvim-treesitter.configs');
if not ok then return end

treesitter.setup{
    ensure_installed = {
        'help',
        'javascript',
        'typescript',
        'rust',
        'lua',
        'markdown',
        'php',
        'phpdoc',
        'scss',
        'toml',
        'vue',
    },

    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
