return {
  name = "CMake Build",
  builder = function()
    -- 这个命令目前主要是 Windows 上用
    return {
      cmd = { "pwsh.exe" },
      args = {
        "-Command",
        [[
& {
Import-Module 'D:\Programs\Microsoft Visual Studio\2022\Community\Common7\Tools\Microsoft.VisualStudio.DevShell.dll';
Enter-VsDevShell 2b0377f8 -SkipAutomaticLocation -DevCmdArguments '-arch=x64 -host_arch=x64';
cmake --build build;
exit
}
]],
      },
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
  condition = {
    filetype = { "cmake" },
  },
}
