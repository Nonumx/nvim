vim.g.mapleader = " "

local opt = vim.opt

opt.number = true -- 行号
opt.cursorline = true -- 高亮本行
opt.expandtab = true -- 使用空格替代TAB键
opt.shiftwidth = 2 -- TAB键缩进长度
opt.tabstop = 2 -- 1TAB = 2空格
opt.ignorecase = true -- 搜索时忽略大小写
opt.smartcase = true -- 搜索时智能判断大小写
opt.smartindent = true -- 智能缩进
opt.termguicolors = true -- 真彩显示
opt.mouse = "a" -- 开启鼠标移动
