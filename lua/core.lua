-- 配置nvim基本设置，如行号，tab，leader键等

local opt = vim.opt

vim.g.mapleader = " "

opt.autowrite = true -- 自动同步磁盘文件修改
opt.clipboard = "unnamedplus" -- 使用系统粘贴板
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3 -- 隐藏粗体和斜体的'*'符号
opt.confirm = true -- 退出前确认缓冲区修改
opt.cursorline = true -- 高亮本行
opt.expandtab = true -- 使用空格替代TAB键
opt.formatoptions = "jcroqlnt" -- 格式化配置
opt.grepformat = "%f:%l:%c:%m" -- 搜索高亮
opt.ignorecase = true -- 搜索时忽略大小写
opt.laststatus = 0
opt.list = true -- 展示某些不可见字符（如TAB键）
opt.mouse = "a" -- 开启鼠标移动
opt.number = true -- 开启行号
opt.pumblend = 10 -- 完善弹窗的透明度
opt.pumheight = 10 -- 设置弹窗的高度
opt.scrolloff = 4 -- 让光标下方有一定的空间展示上下文
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true -- 整数倍缩进
opt.shiftwidth = 2 -- TAB键缩进长度
opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false -- 不在命令栏展示编辑模式
opt.sidescrolloff = 8 -- 上下文缩略
opt.signcolumn = "yes" -- 始终开启调试断点等区域的显示
opt.smartcase = true -- 搜索时智能判断大小写
opt.smartindent = true -- 智能缩进
opt.spelllang = { "en" }
opt.splitbelow = true -- 向下拆分窗格
opt.splitright = true -- 向右拆分窗格
opt.tabstop = 2 -- 1TAB = 2空格
opt.termguicolors = true -- 真彩显示
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 
opt.wildmode = "longest:full,full" -- 命令栏补全方式
opt.winminwidth = 5 -- 最小宽度
opt.wrap = false -- 不允许用多行展示一行文本