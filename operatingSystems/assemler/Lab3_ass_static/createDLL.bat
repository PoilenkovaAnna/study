@echo off
if exist lab.obj del lab.obj
if exist lab.dll del lab.dll
\masm32\bin\ml /c /coff lab.asm
\masm32\bin\Link /SUBSYSTEM:WINDOWS /DLL /DEF:lab.def lab.obj
dir main.*
pause
