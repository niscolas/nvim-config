--- unloading built-in plugins
g.loaded_2html_plugin = 1
g.loaded_fzf = 1
g.loaded_gzip = 1
g.loaded_matchit = 1
g.loaded_matchparen = 1
g.loaded_spec = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_zipPlugin = 1
g.python_host_skip_check = 1

g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0

g.loaded_matchit = 1

--- backup
set.backup = false
set.swapfile = false
set.writebackup = false
set.undofile = true
set.undodir = os.getenv("HOME") .. "/.cache/nvim/undo"

--- completion
set.completeopt = { "menu", "menuone", "noselect" }

--- editor
set.background = "dark"
set.cmdheight = 1
set.colorcolumn = "80"
set.conceallevel = 2
set.cursorcolumn = true
set.cursorline = true
set.errorbells = false
set.fillchars = {
    eob = " ",
    stlnc = "-",
}
set.number = true
set.relativenumber = true
set.ruler = false
set.showcmd = false
set.showmode = false
set.signcolumn = "auto:1"
set.termguicolors = true

-- encoding
set.encoding = "utf-8"
set.fileencoding = "utf-8"

--- hidden characters
set.list = true
set.listchars = {
    tab = "▸ ",
    space = "·",
    nbsp = "␣",
    trail = "•",
    eol = "↴",
    precedes = "«",
    extends = "»",
}

--- indenting
set.autoindent = true
set.expandtab = true
set.shiftround = true
set.shiftwidth = 4
set.smartindent = true
set.softtabstop = 4
set.tabstop = 4

--- leader
g.mapleader = " "

--- misc
set.backspace = "indent,eol,start" -- backspace works on every char in insert mode
set.clipboard = "unnamedplus"
set.exrc = true
set.hidden = true
set.history = 1000
set.laststatus = 3
set.mouse = "a"
set.scrolloff = 8
set.sidescrolloff = 16
set.shell = "zsh"
set.shortmess:append("c")
set.timeoutlen = 50
set.title = true
set.updatetime = 50
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
-- set.spelllang = { "en_us", "pt_br" }
