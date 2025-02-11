return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  keys = {
    { "<leader>do", "<cmd>DiffviewOpen<CR>", desc = "Open Diffview" },
    { "<leader>dc", "<cmd>DiffviewClose<CR>", desc = "Close Diffview" },
    { "<leader>df", "<cmd>DiffviewToggleFiles<CR>", desc = "Toggle Files Panel" },
    { "<leader>dg", "<cmd>DiffviewFocusFiles<CR>", desc = "Focus on Files Panel" },
  },
  config = function()
    require("diffview").setup({
      enhanced_diff_hl = true, -- Enable better highlighting
      use_icons = true, -- Use icons if your terminal supports them
      view = {
        merge_tool = {
          layout = "diff3_mixed", -- Alternative: "diff3_vertical"
        },
      },
      file_panel = {
        listing_style = "tree", -- Options: "list" or "tree"
        win_config = { position = "left", width = 35 },
      },
    })
  end,
}

