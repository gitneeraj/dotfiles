local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    f = {
      name = "Telescope Actions",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      g = { "<Cmd>lua require'telescope.builtin'.live_grep()<CR>", "Live Grep" },
      s = { "<Cmd>lua require'telescope.builtin'.grep_string()<CR>", "Grep String" },
      t = { "<Cmd>lua require'telescope.builtin'.file_browser()<CR>", "File Browser" },
      b = { "<Cmd>lua require'telescope.builtin'.buffers()<CR>", "Buffers" },
      h = { "<Cmd>lua require'telescope.builtin'.help_tags()<CR>", "Help Tags/Docs" },
      o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      n = { "<cmd>enew<cr>", "New File" },
    },
    g = {
      name = "Git Actions",
      c = { "<Cmd>lua require'telescope.builtin'.git_commits()<CR>", "Show Git Commits" },
      b = { "<Cmd>lua require'telescope.builtin'.git_branches()<CR>", "Show Git Branches" },
    },
  },
})
