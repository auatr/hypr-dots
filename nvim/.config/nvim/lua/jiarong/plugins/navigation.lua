return {
  -- File Explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    ft = "netrw",
    opts = {
      filesystem = {
        hijack_netrw_behavior = "open_current"
      }
    },
    config = function()
      require'neo-tree'.setup{
        filesystem = {
          hijack_netrw_behavior = 'open_current'
        }
      }
      if vim.bo.filetype == 'netrw' and vim.b.netrw_method == nil then
        vim.defer_fn(function()
          vim.cmd('enew | Neotree current dir=' .. vim.b.netrw_curdir)
        end, 0)
      end
    end,
    keys = {
      { "<leader>e", function() require("neo-tree.command").execute({ toggle = true }) end, desc = "Explorer NeoTree (root dir)", remap = true },
    }
  },
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {{"nvim-lua/plenary.nvim"}, {"nvim-telescope/telescope-fzf-native.nvim"}},
  },
  -- Which Key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },
      presets = {
        operators = false,
        motions = true,
        text_objects = true,
        window = true,
        nav = true,
        z = true,
        g = true,
      },
      window = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
      },
    },
    {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<C-g>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
      end
    },
  },
}
