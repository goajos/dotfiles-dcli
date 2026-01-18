vim.pack.add { "https://github.com/nvim-treesitter/nvim-treesitter" }
require'nvim-treesitter'.install({
    "c_sharp",
    "cpp",
    "lua",
    "python",
    "rust",
    "typescript"
})

