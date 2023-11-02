local M = {}

local modeMap = {
    ['n']      = '🤗',
    ['no']     = 'O-PENDING',
    ['nov']    = 'O-PENDING',
    ['noV']    = 'O-PENDING',
    ['no\22'] = 'O-PENDING',
    ['niI']    = 'NORMAL',
    ['niR']    = 'NORMAL',
    ['niV']    = 'NORMAL',
    ['nt']     = 'NORMAL',
    ['ntT']    = 'NORMAL',
    ['v']      = '󰅍',
    ['vs']     = 'VISUAL',
    ['V']      = 'V-LINE',
    ['Vs']     = 'V-LINE',
    ['\22']   = 'V-BLOCK',
    ['\22s']  = 'V-BLOCK',
    ['s']      = 'SELECT',
    ['S']      = 'S-LINE',
    ['\19']   = 'S-BLOCK',
    ['i']      = '',
    ['ic']     = 'INSERT',
    ['ix']     = 'INSERT',
    ['R']      = 'REPLACE',
    ['Rc']     = 'REPLACE',
    ['Rx']     = 'REPLACE',
    ['Rv']     = 'V-REPLACE',
    ['Rvc']    = 'V-REPLACE',
    ['Rvx']    = 'V-REPLACE',
    ['c']      = '',
    ['cv']     = 'EX',
    ['ce']     = 'EX',
    ['r']      = 'REPLACE',
    ['rm']     = 'MORE',
    ['r?']     = 'CONFIRM',
    ['!']      = 'SHELL',
    ['t']      = 'TERMINAL',
}

function M.get_mode()
    local mode_code = vim.api.nvim_get_mode().mode
    if modeMap[mode_code] == nil then
        return mode_code
    end
    return modeMap[mode_code]
end

return M