local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

local ok, telescope = pcall(require, "telescope")
if ok then
  local actions = require("telescope.actions")
  
  telescope.setup({
    pickers = {
      buffers = {
        show_all_buffers = true,
        sort_mru = true, -- Sorts by most recently used
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer, -- Press Ctrl+D in insert mode to delete highlighted buffer
          },
          n = {
            ["dd"] = actions.delete_buffer,    -- Press dd in normal mode to delete highlighted buffer
          },
        },
      },
    },
  })
end

-- 3. Set the keymap for <leader>bf
vim.keymap.set('n', '<leader>bf', '<cmd>Telescope buffers<CR>', { 
  noremap = true, 
  silent = true, 
  desc = 'Find open buffers with Telescope' 
})
