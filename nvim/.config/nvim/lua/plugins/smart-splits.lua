return {
  "mrjones2014/smart-splits.nvim",
  lazy = false,
  keys = {
    { "<M-h>", function() require("smart-splits").move_cursor_left() end,  desc = "Move to left split" },
    { "<M-j>", function() require("smart-splits").move_cursor_down() end,  desc = "Move to below split" },
    { "<M-k>", function() require("smart-splits").move_cursor_up() end,    desc = "Move to above split" },
    { "<M-l>", function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" },
  },
}
