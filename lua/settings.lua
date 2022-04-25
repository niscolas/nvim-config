local cmd = vim.cmd
local g = vim.g
local set = vim.opt

--[[ --- unloading built-in plugins
g.loaded_2html_plugin = 0
g.loaded_gzip = 0
g.loaded_matchit = 0
g.loaded_matchparen = 0
g.loaded_python3_provider = 1
g.loaded_spec = 0
g.loaded_tar = 0
g.loaded_tarPlugin = 0
g.loaded_zipPlugin = 0
g.python_host_skip_check = 1
g.loaded_fzf = 1
 ]]
g.loaded_matchit = 1

--- appearance only
set.fillchars = { 
    eob = ' ', 
    vert = ' '
}

--- backup
set.backup = false
set.swapfile = false
set.writebackup = false
set.undofile = true

--- completion
set.completeopt = "menuone,noselect"

--- editor
set.cmdheight = 1
set.colorcolumn = "80"
set.cursorline = true
set.errorbells = false
set.relativenumber = true
set.ruler = false
set.showcmd = false
set.showmode = false
set.signcolumn = "yes:1"
set.number = true

--- encoding
set.encoding = "utf-8"
set.fileencoding = "utf-8"

--- filetype detection
g.do_filetype_lua = 1
g.did_load_filetypes = 0

--- folding
set.foldmethod = "marker"
set.foldmarker = "{{{,}}}"

--- hidden characters
set.list = true
set.listchars = { 
    tab = '▸ ',
    space = '·',
    nbsp = '␣',
    trail = '•',
    eol = '↲',
    precedes = '«',
    extends = '»' 
}

--- indenting
set.autoindent = true
set.expandtab = true
set.shiftround = true
set.shiftwidth = 4
set.smartindent = true
set.softtabstop = -1
set.tabstop = 8

--- leader
g.mapleader = " "

--- misc
set.backspace = "indent,eol,start" -- backspace works on every char in insert mode
set.clipboard = "unnamedplus"
set.exrc = true
set.hidden = true
set.history = 1000
set.scrolloff = 16
set.shortmess:append "c"
set.timeoutlen = 1000
set.title = true
set.updatetime = 200
set.wrap = false

--- navigation
set.splitbelow = true
set.splitright = true

--- search
set.hlsearch = true
set.ignorecase = true
set.incsearch = true
set.smartcase = true

--- spelling
set.spell = false
-- set spell
-- set spelllang=en_us

