return {
  {
    "codota/tabnine-nvim",
    build = "./dl_binaries.sh",
    config = function()
      require("tabnine").setup({
        disable_auto_comment = true,
        accept_keymap = "<Tab>",
        dismiss_keymap = "<C-]>",
        debounce_ms = 800,
        suggestion_color = { gui = "#808080", cterm = 244 },
        exclude_filetypes = { "TelescopePrompt", "NvimTree" },
        log_file_path = nil, -- absolute path to Tabnine log file
      })

      local map = function(keys, func, desc)
        vim.keymap.set("n", keys, func, { desc = "AI: " .. desc })
      end

      require("which-key").register({
        ["<leader>a"] = { name = "[A]i", _ = "which_key_ignore" },
      })

      require("which-key").register({
        ["<leader>at"] = { name = "[AI] Tabnine", _ = "which_key_ignore" },
      })
      -- Tabnine
      map("<leader>atc", ":TabnineChat<CR>", "[T]abnine [C]hat")
      map("<leader>ate", ":TabnineExplain<CR>", "[T]abnine [E]xplain")
      map("<leader>atf", ":TabnineFix<CR>", "[T]abnine [F]ix")
      map("<leader>att", ":TabnineTest<CR>", "[T]abnine [T]est")
      map("<leader>ats", ":TabnineStatus<CR>", "[T]abnine [S]tatus")
    end,
  },
}
