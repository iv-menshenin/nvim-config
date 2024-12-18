local opt = vim.opt

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true
opt.wrap = true

opt.clipboard = "unnamed"

-- buffline requirements:
opt.termguicolors = true
opt.cursorline = true
opt.cursorlineopt = "number"
opt.colorcolumn = "100"

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.sessionoptions = "buffers,curdir,folds,globals,options,localoptions,tabpages,winpos,winsize,terminal"

opt.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz,бюжЖЮБ;\\,.\\;:><"
