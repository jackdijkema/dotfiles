return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- Vereist
    "sindrets/diffview.nvim",        -- Optioneel - Diff integratie
    "nvim-telescope/telescope.nvim", -- Optioneel - Telescope integratie
  },
  keys = {
    { "<leader>gg", function() require("neogit").open() end, desc = "Open Neogit" },
  },
  config = function()
    require("neogit").setup({
      integrations = {
        diffview = true,
      },
    })
  end,
}

