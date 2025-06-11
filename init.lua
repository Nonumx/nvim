-- [[ 插件管理器 ]]
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.deps"
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.deps`" | redraw')
  local clone_cmd = {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/echasnovski/mini.deps",
    mini_path,
  }
  vim.fn.system(clone_cmd)
  vim.cmd("packadd mini.deps | helptags ALL")
  vim.cmd('echo "Installed `mini.deps`" | redraw')
end
-- 配置 mini.deps
require("mini.deps").setup({ path = { package = path_package } })
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- [[ 基本配置 ]]
now(function()
  -- 使用空格作为 <leader> 键
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  -- 简写配置
  local o = vim.opt

  o.number = true -- 显示行号
  o.fillchars = { eob = " " } -- 关闭文件末尾的 '~' 符号
  o.mouse = "a" -- 允许使用鼠标，例如重置窗口大小
  o.showmode = false -- 不在命令行中显示编辑模式
  o.breakindent = true -- 换行后的代码保持与原行相同的缩进
  o.cursorline = true -- 高亮当前行
  o.expandtab = true -- 使用空格而不是制表符
  o.tabstop = 2 -- 默认两个空格
  o.shiftwidth = 2 -- 同上
  o.wrap = false -- 不进行自动换行
  o.updatetime = 300 -- 插件触发频率
  o.shortmess = vim.tbl_deep_extend("force", vim.opt.shortmess:get(), { s = true, I = true, c = true, C = true }) -- 禁用搜索、欢迎、补全的信息
  o.writebackup = false -- 禁用文件覆盖时的备份功能
  o.completeopt = "menu,menuone,noselect" -- 调整补全菜单
  o.termguicolors = true -- 真彩显示

  -- 显式展示空格、制表符
  o.list = true
  o.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

  -- 搜索时智能判断大小写
  o.ignorecase = true
  o.smartcase = true

  o.laststatus = 3 -- 只使用一个状态栏
  o.statusline = " " -- 状态栏插件加载完成前保持为空
  o.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
end)

-- [[ 键盘映射 ]]
now(function()
  local map = vim.keymap.set

  -- 普通模式下通过 <esc> 关闭搜索高亮
  map("n", "<esc>", "<cmd>noh<cr>")

  -- 鼠标选中后 <Ctrl-c> 复制到系统剪贴板
  map("v", "<C-c>", '"+y')
  -- 普通模式或选中时，<Ctrl-v> 粘贴系统剪贴板
  map({ "n", "v" }, "<C-v>", '"+p')
  map("i", "<C-v>", '<esc>"+p')

  -- 使用 <Ctrl-[hjkl]> 移动光标到窗口
  map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
  map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
  map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
  map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

  -- 使用分号代替冒号（少按一个 <Shift> 键）
  map("n", ";", ":", { desc = "CMD enter command mode" })

  -- 保存文件
  map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

  -- quit
  map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
end)

-- [[ 颜色主题 ]]
now(function()
  add({ source = "rebelot/kanagawa.nvim" })
  require("kanagawa")
  vim.cmd("colorscheme kanagawa")
end)

-- [[ 图标库 ]]
now(function()
  add({ source = "echasnovski/mini.icons" })
  require("mini.icons").setup()
end)
-- [[ 状态栏 ]]
now(function()
  add({ source = "echasnovski/mini.statusline" })
  require("mini.statusline").setup()
end)

-- [[ snacks.nvim ]]
now(function()
  add({ source = "folke/snacks.nvim" })
  require("snacks").setup({
    explorer = { replace_netrw = true },
    input = { enabled = true },
    notifier = { enabled = true },
    picker = { enabled = true },
    indent = { enabled = true },
    scope = { enabled = true },
  })
  local map = vim.keymap.set
  map("n", "<leader>e", function()
    Snacks.explorer()
  end, { desc = "File Explorer" })
  map("n", "<leader>n", function()
    Snacks.picker.notifications()
  end, { desc = "Picker: Notification History" })
  map("n", "<leader><space>", function()
    Snacks.picker.smart()
  end, { desc = "Picker: Smart Find Files" })
  map("n", "<leader>/", function()
    Snacks.picker.grep()
  end, { desc = "Picker: Grep Workspace" })
end)

-- [[ 自动配对 ]]
later(function()
  add({ source = "echasnovski/mini.pairs" })
  require("mini.pairs").setup()
end)
-- [[ 快速环绕 ]]
later(function()
  add({ source = "echasnovski/mini.surround" })
  require("mini.surround").setup()
end)
-- [[ 快捷键提示 ]]
later(function()
  add({ source = "folke/which-key.nvim" })
  require("which-key").setup({
    preset = "helix",
  })
  vim.keymap.set("n", "<leader>?", function()
    require("which-key").show({ global = false })
  end, { desc = "Buffer Local Keymaps (which-key)" })
end)

-- [[ LSP配置 ]]
later(function()
  local lsp_dir = vim.fn.stdpath("config") .. "/lsp/"
  local lsp_configs = vim.fn.globpath(lsp_dir, "*.lua", false, true)
  for _, lsp_config in ipairs(lsp_configs) do
    local lsp_name = vim.fn.fnamemodify(lsp_config, ":t:r")
    vim.lsp.enable(lsp_name)
  end
end)

-- [[ 代码格式化 ]]
later(function()
  add({ source = "stevearc/conform.nvim" })
  require("conform").setup({
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
    },
    formatters_by_ft = {
      lua = { "stylua" },
    },
  })
  vim.keymap.set("n", "<leader>cf", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
  end, { desc = "Format buffer" })
end)

-- [[ Treesitter配置 ]]
later(function()
  add({
    source = "nvim-treesitter/nvim-treesitter",
    -- Use 'master' while monitoring updates in 'main'
    checkout = "master",
    monitor = "main",
    -- Perform action after every checkout
    hooks = {
      post_checkout = function()
        vim.cmd("TSUpdate")
      end,
    },
  })
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "bash",
      "c",
      "diff",
      "html",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "query",
      "vim",
      "vimdoc",
      "cpp",
      "python",
      "cmake",
    },
    highlight = { enable = true },
    indent = { enable = true },
  })
end)

-- [[ 自动补全引擎 ]]
later(function()
  add({
    source = "saghen/blink.cmp",
    checkout = "v1.3.1",
    depends = { "rafamadriz/friendly-snippets" },
  })
  require("blink.cmp").setup({
    keymap = {
      preset = "super-tab",
    },
    appearance = {
      nerd_font_variant = "normal",
    },
    signature = { enabled = true },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      per_filetype = {
        codecompanion = { "codecompanion" },
      },
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 300,
      },
      menu = {
        draw = {
          columns = {
            { "kind_icon", "label" },
            { "kind" },
          },
        },
      },
    },
  })
end)

-- [[ 进度条 ]]
later(function()
  add({ source = "j-hui/fidget.nvim" })
  require("fidget").setup({})
end)

-- [[ Git状态 ]]
later(function()
  add({ source = "lewis6991/gitsigns.nvim" })
  require("gitsigns").setup({ trouble = true })
end)
