local Job = require("plenary.job")

local M = {}

M.vswhere_path = vim.fn.stdpath("data") .. "/tools/vswhere.exe"
---@type string?
M.vspath = nil
---@type Job?
M.vsdevcmd = nil
---@type string[]
M.stdout_cache = {}

M.warn_vswhere_on_first = true
M.warn_vspath_on_first = true

M.name = "lsp/cmake"

function M:setup_vsdevcmd()
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

  -- Found Visual Studio or No Visual Studio
  if self.vspath ~= nil or not M.warn_vspath_on_first then
    return
  end

  ---@diagnostic disable-next-line:missing-fields
  local found = Job:new({
    command = M.vswhere_path,
    args = {
      "-property",
      "installationPath",
    },
  }):sync()
  if found == nil then
    if M.warn_vspath_on_first then
      local message = {
        "Failed to locate `Visual Studio`",
        "Please verify you have VS2017 or above",
        "installed on your machine",
      }
      vim.notify(table.concat(message, "\n"), "warn", { title = M.name })
      M.warn_vspath_on_first = false
    end
    return
  end
  -- Assuming the user will not uninstall Visual Studio during coding
  M.vspath = found[1]

  local vcvars_path = self.vspath .. [[\VC\Auxiliary\Build\vcvarsall.bat]]
  -- Launch cmd.exe in the background and wait for cmake command
  ---@diagnostic disable-next-line missing-fields
  self.vsdevcmd = Job:new({
    command = "cmd.exe",
    args = {
      "/k",
      "%VCVars% x64",
    },
    env = {
      VCVars = string.format('"%s"', vcvars_path),
    },
    on_stdout = function(_, data)
      if data ~= "" then
        table.insert(M.stdout_cache, data)
      else
        vim.schedule(function()
          vim.notify(table.concat(M.stdout_cache, "\n"), "info", { title = self.name })
          M.stdout_cache = {}
        end)
      end
    end,
    on_exit = function(_, code)
      vim.schedule(function()
        vim.notify("cmd exit with code " .. code, "info", { title = self.name })
      end)
    end,
  })
  self.vsdevcmd:start()
end

function M:cmake_configure()
  if self.vsdevcmd == nil then
    return
  end

  self.vsdevcmd:send("cmake.exe -B build -G Ninja -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE\n")
end

function M:cmake_build()
  if self.vsdevcmd == nil then
    return
  end

  self.vsdevcmd:send("cmake.exe --build build\n")
end

function M:cmake_clean()
  if self.vsdevcmd == nil then
    return
  end

  self.vsdevcmd:send("cmake.exe --build build --target clean\n")
end

function M:cmake_run()
  local build_dir = vim.loop.cwd() .. "/build/"
  local executables = vim.fn.globpath(build_dir, "*.exe", false, true)
  local targets = {}
  for _, executable in ipairs(executables) do
    local exe_name = vim.fn.fnamemodify(executable, ":t")
    table.insert(targets, exe_name)
  end
  if #targets == 0 then
    vim.notify("No targets in the build directory", "warn", { title = M.name })
    return
  end
  vim.ui.select(targets, {
    prompt = "Please select a target to run",
    format_item = function(item)
      return "👉 " .. item
    end,
  }, function(choice)
    local executable = build_dir .. "/" .. choice
    Snacks.terminal("cmd /k " .. executable)
  end)
end

return {
  cmd = { "cmake-language-server" },
  filetypes = { "cmake" },
  root_markers = { "CMakePresets.json", "CTestConfig.cmake", ".git", "build", "cmake" },
  init_options = {
    buildDirectory = "build",
  },
  on_init = function()
    M:setup_vsdevcmd()

    local cmake_augroup = vim.api.nvim_create_augroup("CMakeAugroup", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      group = cmake_augroup,
      pattern = { "CMakeLists.txt", "*.cmake" },
      callback = function()
        M:cmake_configure()
      end,
    })

    vim.api.nvim_create_user_command("CMakeConfigure", function()
      M:cmake_configure()
    end, { desc = "CMake configure" })
    vim.api.nvim_create_user_command("CMakeBuild", function()
      M:cmake_build()
    end, { desc = "CMake build" })
    vim.api.nvim_create_user_command("CMakeClean", function()
      M:cmake_clean()
    end, { desc = "CMake clean" })
    vim.api.nvim_create_user_command("CMakeRun", function()
      M:cmake_run()
    end, { desc = "CMake run" })
  end,
}
