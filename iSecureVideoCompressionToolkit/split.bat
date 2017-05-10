@echo off
REM created by Ali Lakhwaira - file splitter that conforms to GTI's boundaries 10th April 2017
rem
      ren 7z.dll 7z.exe
      :again
      rem Set time value
      for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
      set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
      set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%" 
      rem end time value
      set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"
      set "destination=%~dp1%~n1_%fullstamp%"
      echo "%~1"
      echo "%destination%"
      md "%~n1_%fullstamp%"
      7z a "%destination%\%~n1_%~z1.zip" "%~1" -mx3 -v15m -bt >> %fullstamp%_SplitLogFile_Ali.txt
     shift      
      if "%~1" == "" goto:done
      goto:again
      echo.
      rem  
    :done
    ren 7z.exe 7z.dll