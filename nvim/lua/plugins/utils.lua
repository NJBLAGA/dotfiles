return {
  { "tpope/vim-endwise", event = "VeryLazy" }, -- automatically add end pairs: if/fi, function/end, etc.
  { "andrewradev/tagalong.vim", event = "VeryLazy" }, -- automatically edit matching html tag when one is changed
  { "ellisonleao/glow.nvim", opts = {}, cmd = "Glow" }, -- preview markdown in nvim
  { "nacro90/numb.nvim", opts = {}, event = "VeryLazy" }, -- preview jump location before committing to it
  {
    -- floating window to preview locations
    "rmagatti/goto-preview",
    event = "VeryLazy",
    opts = {
      default_mappings = true,
      -- resizing_mappings = true,
      references = {
        telescope = require("telescope.themes").get_dropdown({ hide_preview = false }),
      },
    },
  },
  {
    -- show lightbulb icon in gutter to show code actions are available
    "kosayoda/nvim-lightbulb",
    event = "BufReadPost",
    opts = {
      autocmd = {
        enabled = true,
      },
    },
  },
}
