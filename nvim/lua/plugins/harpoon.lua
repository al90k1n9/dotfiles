return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- Required setup call
    harpoon:setup()

    -- Keymaps setup
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon: Add File" })
    vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: Menu" })

    -- Jump to files 1 through 4
    vim.keymap.set("n", "<leader>&", function() harpoon:list():select(1) end, { desc = "Harpoon: File 1" })
    vim.keymap.set("n", "<leader>é", function() harpoon:list():select(2) end, { desc = "Harpoon: File 2" })
    vim.keymap.set("n", "<leader>\"", function() harpoon:list():select(3) end, { desc = "Harpoon: File 3" })
    vim.keymap.set("n", "<leader>\'", function() harpoon:list():select(4) end, { desc = "Harpoon: File 4" })

    -- Navigate next/previous file in list
    --vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Harpoon: Prev File" })
    --vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Harpoon: Next File" })
  end,
}
