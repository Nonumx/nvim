local M = {}

M.vswhere_path = vim.fn.stdpath("data") .. "/tools/vswhere.exe"

M.warn_vswhere_on_first = true

M.warn_vspath_on_first = true

local function auto_reconfigure() end

return {
  cmd = { "cmake-language-server" },
  filetypes = { "cmake" },
  root_markers = { "CMakePresets.json", "CTestConfig.cmake", ".git", "build", "cmake" },
  init_options = {
    buildDirectory = "build",
  },
  on_attach = function()
    if not vim.loop.fs_stat(M.vswhere_path) then
      if M.warn_vswhere_on_first then
        local message = {
          "Failed to locate `vswhere.exe`",
          "Please copy `vswhere.exe` to following path:",
          "```lua",
          'vim.fn.stdpath("data") .. "/tools/"',
          "```",
        }
        vim.notify(table.concat(message, "\n"), "warn", { title = "lsp/cmake" })
        M.warn_vswhere_on_first = false
      end
      return
    end
    local cmake_augroup = vim.api.nvim_create_augroup("CMakeAugroup", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      group = cmake_augroup,
      pattern = { "CMakeLists.txt", "*.cmake" },
      callback = auto_reconfigure,
    })
    auto_reconfigure()
  end,
}
