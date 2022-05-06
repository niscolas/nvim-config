local vim = vim

--- unloading built-in plugins
vim.g.loaded_2html_plugin = 1
vim.g.loaded_fzf = 1
vim.g.loaded_gzip = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_python3_provider = 1
vim.g.loaded_spec = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.python_host_skip_check = 1

vim.g.loaded_matchit = 1

--- backup
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.undofile = true

--- completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }

--- editor
vim.g.dap_virtual_text = true
vim.opt.cmdheight = 1
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.errorbells = false
vim.opt.fillchars = {
    eob = ' ',
}
vim.opt.number = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = false
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.signcolumn = "auto:1"

-- encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

--- filetype detection
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

--- hidden characters
vim.opt.list = true
vim.opt.listchars = {
    tab = '▸ ',
    space = '·',
    nbsp = '␣',
    trail = '•',
    eol = '↲',
    precedes = '«',
    extends = '»'
}

--- indenting
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.softtabstop = -1
vim.opt.tabstop = 8

--- leader
vim.g.mapleader = " "

--- misc
vim.opt.backspace = "indent,eol,start" -- backspace works on every char in insert mode
vim.opt.clipboard = "unnamedplus"
vim.opt.exrc = true
vim.opt.hidden = true
vim.opt.history = 1000
vim.opt.scrolloff = 16
vim.opt.shortmess:append "c"
vim.opt.timeoutlen = 1000
vim.opt.title = true
vim.opt.updatetime = 200
vim.opt.wrap = false

--- navigation
vim.opt.splitbelow = true
vim.opt.splitright = true

--- search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true

--- spelling
vim.opt.spell = true
vim.opt.spelllang = { "en_us", "pt_br" }
