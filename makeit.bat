@echo off

    if exist "fprintf.obj" del "fprintf.obj"
    if exist "fprintf.exe" del "fprintf.exe"

    \masm32\bin\ml /c /coff "fprintf.asm"
    if errorlevel 1 goto errasm

    \masm32\bin\PoLink /SUBSYSTEM:CONSOLE "fprintf.obj"
    if errorlevel 1 goto errlink
    dir "fprintf.*"
    goto TheEnd

  :errlink
    echo _
    echo Link error
    goto TheEnd

  :errasm
    echo _
    echo Assembly Error
    goto TheEnd
    
  :TheEnd

pause
