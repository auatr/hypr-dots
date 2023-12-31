-- Minor plugins that don't fit into seperate files
return {
  { "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end,
  },
  { 
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl", 
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
            "help",
            "alpha",
            "dashboard",
            "neo-tree",
            "Trouble",
            "trouble",
            "lazy",
            "mason",
            "notify",
            "toggleterm",
            "lazyterm",
        },
      },
    },
  },
}
