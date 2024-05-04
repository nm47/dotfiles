require("mason").setup {}
require("mason-lspconfig").setup {
    ensure_installed = { 'rust_analyzer', 'clangd'}, -- List of LSPs you want to automatically install
    automatic_installation = true,
    package_manager = "pip"
}

