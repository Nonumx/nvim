local M = {}

M.vswhere_path = vim.fn.stdpath("data") .. "/tools/vswhere.exe"

M.warn_vswhere_on_first = true

M.warn_vspath_on_first = true

M.name = "lsp/cmake"

M.auto_reconfigure = function()
  local Job = require("plenary.job")
  ---@diagnostic disable-next-line:missing-fields
  local res = Job:new({
    command = M.vswhere_path,
    args = {
      "-property",
      "installationPath",
    },
  }):sync()
  if res == nil then
    if M.warn_vspath_on_first then
      local message = {
        "Failed to locate `Visual Studio`",
        "Please verify you have VS2017 or above",
        "installed on your machine",
      }
      vim.notify(table.concat(message, "\n"), "warn", { title = "lsp/cmake" })
      M.warn_vspath_on_first = false
    end
    return
  end
  local vspath = res[1]
  local vcvars_path = vspath .. [[\VC\Auxiliary\Build\vcvarsall.bat]]
  local command_args = {
    "%VCVars% x64",
    "powershell.exe -c cmake.exe -B build -G Ninja -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE",
  }
  ---@diagnostic disable-next-line:missing-fields
  Job:new({
    command = "cmd.exe",
    args = {
      "/c",
      table.concat(command_args, " && "),
    },
    env = {
      VCVars = string.format('"%s"', vcvars_path),
    },
    on_exit = function(j, return_val)
      -- on_exit在异步上下文中
      -- vim.notify必须在安全上下文中执行
      vim.schedule(function()
        local j_message = table.concat(j:result() or {}, "\n")
        if return_val == 0 then
          vim.notify(j_message, "info", { title = M.name })
        else
          vim.notify(j_message, "warn", { title = M.name })
        end
      end)
    end,
  }):start()
end

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
        vim.notify(table.concat(message, "\n"), "warn", { title = M.name })
        M.warn_vswhere_on_first = false
      end
      return
    end
    local cmake_augroup = vim.api.nvim_create_augroup("CMakeAugroup", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      group = cmake_augroup,
      pattern = { "CMakeLists.txt", "*.cmake" },
      callback = M.auto_reconfigure,
    })
  end,
}
