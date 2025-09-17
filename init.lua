-- my nvim config
--

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
  end
  vim.opt.rtp:prepend(lazypath)

  -- Plugins
  require("lazy").setup({
    -- Cyberdream colorscheme
    {
      "scottmckendry/cyberdream.nvim",
      lazy = false,
      priority = 1000,
      config = function()
      require("cyberdream").setup({
        transparent = true,
        italic_comments = true,
        terminal_colors = true,
        borderless_pickers = true,
      })
      vim.cmd("colorscheme cyberdream")
      end,
    },

    -- Statusline
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
      require("lualine").setup({
        options = { theme = "cyberdream" },
      })
      end,
    },

    -- File explorer
    {
      "nvim-tree/nvim-tree.lua",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
      require("nvim-tree").setup({})
      vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
      end,
    },

    -- Treesitter (for modern highlights)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "python", "c", "cpp", "javascript", "typescript" },
      highlight = { enable = true },
    })
    end,
  },

  -- Autocompletion (cmp + snippets)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
                                          ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = "path" },
      }),
      window = {
        completion = cmp.config.window.bordered(),
              documentation = cmp.config.window.bordered(),
      },
    })
    end,
  },

  -- LSP (so cmp works with language servers)
  { "neovim/nvim-lspconfig" },
  })

  -- Enable true colors
  vim.o.termguicolors = true

