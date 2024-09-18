local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = "patrick.lazy",
    change_detection = { notify = false }
})

require("lazy").setup({
  {
      "nvim-telescope/telescope.nvim",
      dependencies = {
          "nvim-lua/plenary.nvim"
      },
      tag = "0.1.0",
  },

  {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      config = function()
          vim.cmd([[colorscheme tokyonight]])
      end,
  },

  {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
  },

  "nvim-treesitter/playground",

  "mbbill/undotree",
  "tpope/vim-fugitive",

  "hrsh7th/nvim-cmp",

  {
      "VonHeikemen/lsp-zero.nvim",
      branch = "v4.x",
      dependencies = {
          "williamboman/mason.nvim",
          "williamboman/mason-lspconfig.nvim",
          "neovim/nvim-lspconfig",
          "hrsh7th/nvim-cmp",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
          "saadparwaiz1/cmp_luasnip",
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-nvim-lua",
          "L3MON4D3/LuaSnip",
          "rafamadriz/friendly-snippets",
      },
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  "folke/zen-mode.nvim"
})

