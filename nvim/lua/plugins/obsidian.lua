return {
  {
    "epwalsh/obsidian.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>oo", "<cmd>ObsidianOpen<cr>" },
      { "<leader>on", "<cmd>ObsidianNew<cr>" },
      { "<leader>oT", "<cmd>ObsidianTemplate<cr>" },
      { "<leader>ot", "<cmd>ObsidianToday<cr>" },
      { "<leader>oy", "<cmd>ObsidianYesterday<cr>" },
      { "<leader>ol", "<cmd>ObsidianLink<cr>" },
      { "<leader>oL", "<cmd>ObsidianLinkNew<cr>" },
      { "<leader>ob", "<cmd>ObsidianBacklinks<cr>" },
      { "<leader>os", "<cmd>ObsidianSearch<cr>" },
      { "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>" },
    },
    opts = {
      dir = "~/Documents/ObsidianVault/MyVault/",
      completion = {
        nvim_cmp = true, -- with this set to true, it automatically configures completion on its own
      },
    },
    config = function(_, opts)
      require("obsidian").setup(opts)

      -- if cursor is on a link in an obsidian file, gf will follow the reference, otherwise it will behave normally
      vim.keymap.set("n", "gf", function()
        if require("obsidian").util.cursor_on_markdown_link() then
          return "<cmd>ObsidianFollowLink<CR>"
        else
          return "gf"
        end
      end, { noremap = false, expr = true })
    end,
  },
}
