@echo off
setlocal enabledelayedexpansion
set number=%1

set sign= 
set firstChar=!number:~0,1! 

    if "!firstChar!" == "- " (
        set sign=-
        set number=!number:~1!
    
      )
      if "!firstChar!" == "+ " (
        set number=!number:~1!
    
      )
set lenght=
call GetLenght %number% lenght

::проверка на недопутимые символы в начале 0
set checChar=!number:~0,1!
if "%checChar%" == "." (
    echo error number
    goto :eof
    )
if "%checChar%" == "0" (
  if %lenght% == 1 (
    echo 0
    goto :eof
    )
  set secondChar=!number:~1,1!
  if "!secondChar!" neq "." (
    echo error number
    goto :eof
    )
  )
:: проверяем кол-во точек и 1
set /a count_dot=0
set /a count_one=0
for /l %%i in ( 0, 1, %lenght% ) do (
    set local=!number:~%%i,1!
    if "!local!" == "." (set /a count_dot=!count_dot! + 1)
    if "!local!" == "1" (set /a count_one=!count_one! + 1)
    )
if "%count_dot%" gtr "1" (
  echo too many dots
  goto :eof
  )
if "%count_one%" equ "0" (
  echo Answer: 0
  goto :eof
  )


set  t=0
set  fl=0

:chek
if %t% geq %lenght% goto :endChek
if "!number:~%t%,1!" neq "1" (
  if "!number:~%t%,1!" neq "0" (
    if "!number:~%t%,1!" neq "." (
          set "fl=1"       
          )
    )
  )
    set /a t+=1
    goto :chek
:endChek
if "%fl%" == "1" (
  echo symbol error 
  goto :eof
  )


set whol=
set fac=
set transWhol=
set transFac=
call :separat %1 fac whol


call :procesWhole %whol% transWhol
call :procesFract %fac% transFac

if "%fac%" == "0" (
  echo Answer: %sign%%transWhol%
  ) else (
  echo Answer: %sign%%transWhol%.%transFac%
  )
goto :eof


::===========================================================================================
:: разделение числа на дробню и целую часть
:separat
set alllen=
call GetLenght %~1 alllen
set num=%~1

set "whole="
set "fact=0"
set "iFract="

set /a i=0

:loopWhole
if %i% gtr %allLen% goto :endSepar
if "!num:~%i%,1!" neq "."  (
     call set whole=%%num:~0,%i%%%
  ) else (
       set /a i+=1
       call set whole=%%num:~0,%i%%%
     set iFract=%i%
     set /a iFract+=1
     goto :loopFact
     )
    set /a i+=1
    goto :loopWhole

:loopFact
if %i% gtr %allLen% goto :endSepar
call set fact=%%num:~%iFract%,%i%%%
set /a i+=1
goto :loopFact

:endSepar 
set %~2=%fact%
set %~3=%whole%
exit /b 
::________________________________________

::обработка целой части 
:procesWhole
set len=
call GetLenght %1 len
set num=%1
set /a res=0
set /a one_res=0
set /a k=len-1
set /a i=0
:loopW
if %i% equ %len% goto :endWhole
if "!num:~%k%,1!" equ "1"  (
  call :exponentiation !i! one_res
  set /a res+=!one_res!
  )
set /a k-=1
set /a i+=1
goto :loopW

:: возведенеи 2 в степень 
:exponentiation
if %~1 equ 0 (
  set %~2=1
  exit /b 0
  )
set step=%~1
set  n=0
set  ans=1
:loop1
set /a n+=1
set /a ans*=2
if "%step%" neq "%n%" goto :loop1 
set %~2=%ans%
exit /b 0

:endWhole
set %~2=%res%
exit /b
::-----------------------------------

::обработка дробной части
:procesFract
set len=
call GetLenght %1 len
set num=%1
set /a o=1

set /a k=0
:loopF
if "%k%" equ "%len%" goto :base
set /a o*=10
set /a k+=1
goto :loopF

:base
set /a i=0
set /a den=2
set /a one=0
set /a res=0
:loopFF
if %i% gtr %len% goto :endFract
if "!num:~%i%,1!" equ "1"  (
  set /a one=o/den
  set /a res+=!one!
  )
set /a den*=2
set /a i+=1
goto :loopFF

:endFract
::убираем нули 
set /a q=0
:checkZero
set /a q+=1
set lastSumb=!res:~-%q%,1!
if "!lastSumb!" neq "0" (
    set res=!res:~0,%len%!  
  ) else (
  set /a len-=1
  set res=!res:~0,%len%!
  goto :checkZero
  )

set %~2=%res%
exit /b 0 
::———————
