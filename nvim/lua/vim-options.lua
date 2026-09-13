--vim.cmd("set expandtab")
--vim.cmd("set tabstop=2")
--vim.cmd("set softtabstop=2")
--vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.background = "light"
vim.g.have_nerd_font = true

vim.opt.swapfile = false
vim.opt.mouse = ""

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
vim.keymap.set('n', '<leader>q', function()
    local qf_exists = false
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype =="qf" then
            qf_exists = true
            vim.api.nvim_win_close(win, true)
            break
        end
    end
    if not qf_exists then
        vim.cmd('copen')
    end
end, {desc='Toggle quickfix list'})

vim.keymap.set('n', '<A-j>', ':cnext<CR>', { desc = 'Quickfix Next' })
vim.keymap.set('n', '<A-k>', ':cprev<CR>', { desc = 'Quickfix Prev' })

vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>')
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.o.scrolloff = 5

vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.tabstop = 4      -- Number of spaces a <Tab> counts for
vim.o.shiftwidth = 4   -- Number of spaces for each indentation
vim.o.softtabstop = 4  -- Number of spaces inserted for a <Tab>

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})


local function disable_arrow_keys()
  local modes = { 'n', 'i', 'v' } -- normal, insert, visual
  local keys = { '<Up>', '<Down>', '<Left>', '<Right>' }

  for _, mode in ipairs(modes) do
    for _, key in ipairs(keys) do
      vim.keymap.set(mode, key, '<Nop>', { noremap = true, silent = true })
    end
  end
end

disable_arrow_keys()

