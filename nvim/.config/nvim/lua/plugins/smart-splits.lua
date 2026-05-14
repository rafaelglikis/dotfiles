return {
  "mrjones2014/smart-splits.nvim",
  lazy = false,
  init = function()
    vim.g.smart_splits_multiplexer_integration = false
  end,
  opts = {
    multiplexer_integration = false,
  },
  keys = {
    { "<M-h>", function() require("smart-splits").move_cursor_left() end,  desc = "Move to left split" },
    { "<M-j>", function() require("smart-splits").move_cursor_down() end,  desc = "Move to below split" },
    { "<M-k>", function() require("smart-splits").move_cursor_up() end,    desc = "Move to above split" },
    { "<M-l>", function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" },
    { "<C-A-h>", function() require("smart-splits").resize_left() end,     desc = "Resize split left" },
    { "<C-A-j>", function() require("smart-splits").resize_down() end,     desc = "Resize split down" },
    { "<C-A-k>", function() require("smart-splits").resize_up() end,       desc = "Resize split up" },
    { "<C-A-l>", function() require("smart-splits").resize_right() end,    desc = "Resize split right" },
    {
      "<C-A-m>",
      function()
        vim.cmd("wincmd _")
        vim.api.nvim_cmd({ cmd = "wincmd", args = { "|" } }, {})
      end,
      desc = "Maximize split",
    },
  },
}
