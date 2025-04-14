-- [[ 用户命令 ]]

-- 切换到用户配置目录
vim.api.nvim_create_user_command('CdConfig', function()
    local config_dir = vim.fn.stdpath('config')
    vim.cmd('cd ' .. config_dir)
    vim.notify('Switched to config directory: ' .. config_dir, vim.log.levels.INFO)
end, {})
