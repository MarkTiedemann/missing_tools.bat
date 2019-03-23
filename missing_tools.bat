@echo off
setlocal enabledelayedexpansion

set required_tool_count=0
for %%x in (%*) do (
  set /a required_tool_count+=1
)

if %required_tool_count% equ 0 goto :eof
for /l %%x in (1, 1, %required_tool_count%) do (
  call set required_tools[%%x]=%%%%x
)

set missing_tool_count=0
for /f "tokens=2 delims==" %%x in ('set required_tools[') do (
  if not exist %%x (
    for %%y in (%%x) do (
      if [%%~$PATH:y] == [] (
        call set missing_tools[!missing_tool_count!]=%%%%x
        set /a missing_tool_count+=1
      )
    )
  )
)

if %missing_tool_count% equ 0 goto :eof
set i=0
for /f "tokens=2 delims==" %%x in ('set missing_tools[') do (
  for %%y in (%%x) do (
    if !i! equ 0 (
      <nul set /p="%%y"
    ) else (
      set /a j=!i!+1
      if !j! equ %missing_tool_count% (
        <nul set /p=", and %%y"
      ) else (
        <nul set /p=", %%y"
      )
    )
  )
  set /a i+=1
)

endlocal
