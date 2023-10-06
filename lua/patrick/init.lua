require("patrick.remap")
require("patrick.set")

local augroup = vim.api.nvim_create_augroup
local PatrickGroup = augroup('Patrick', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = PatrickGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

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
  {
      "nvim-telescope/telescope.nvim",
      dependencies = {
          "nvim-lua/plenary.nvim"
      },
      tag = "0.1.0",
  },

  {
      "folke/tokio-night.nvim",
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
  "theprimeagen/harpoon",
  "mbbill/undotree",
  "tpope/vim-fugitive",

  {
      "VonHeikemen/lsp-zero.nvim",
      dependencies = {
          "neovim/neovim-lspconfig",
          "williamboman/mason.nvim",
          "williamboman/mason-lspconfig.nvim",

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

  "folke/zen-mode.nvim"
})
