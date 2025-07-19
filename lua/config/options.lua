-- 使用空格作为 <leader> 键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 简写配置
local o = vim.opt

-- 状态栏
o.laststatus = 3 -- 只使用一个状态栏
o.statusline = " " -- 状态栏插件加载完成前保持为空
o.showmode = false -- 不在命令行中显示编辑模式

-- 缩进
o.expandtab = true -- 使用空格而不是制表符
o.tabstop = 2 -- 默认两个空格
o.shiftwidth = 2 -- 同上
o.smartindent = true -- 智能缩进

-- 搜索时智能判断大小写
o.ignorecase = true
o.smartcase = true

-- 显式展示空格、制表符
o.list = true
o.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

o.fillchars = { eob = " " } -- 关闭文件末尾的 '~' 符号

o.number = true -- 显示行号
o.mouse = "a" -- 允许使用鼠标，例如重置窗口大小
o.cursorline = true -- 高亮当前行
o.wrap = false -- 不进行自动换行
o.updatetime = 300 -- 插件触发频率
o.shortmess = vim.tbl_deep_extend("force", vim.opt.shortmess:get(), { s = true, I = true, c = true, C = true }) -- 禁用搜索、欢迎、补全的信息
o.writebackup = false -- 禁用文件覆盖时的备份功能
o.completeopt = "menu,menuone,noselect" -- 调整补全菜单
o.termguicolors = true -- 真彩显示
