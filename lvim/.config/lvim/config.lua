-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.plugins = {
  {"folke/tokyonight.nvim"},
  {"vimwiki/vimwiki"},
  {"nvim-neorg/neorg", ft = "norg", cmd = 'Neorg', priority = 30, config = function ()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {},
        ['core.concealer'] = {},
        ['core.dirman'] = {
          config = {
            workspaces = {
              notes = "~/notes/"
            }
          }
        }
      },
    }
  end},
  {"jbyuki/nabla.nvim", ft = "norg"}
}


require("tokyonight").setup({
  style = "moon",
  transparent = true
})
lvim.colorscheme = "tokyonight"

lvim.keys.normal_mode["<Space>m"] = require("nabla").popup()

local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }
keymap('n', '<Up>', '<Nop>', opts)
keymap('n', '<Down>', '<Nop>', opts)
keymap('n', '<Left>', '<Nop>', opts)
keymap('n', '<Right>', '<Nop>', opts)
