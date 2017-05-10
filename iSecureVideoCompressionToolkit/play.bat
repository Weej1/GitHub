@echo off
REM created by Ali Lakhwaira - conversion that conforms to GTI's boundaries 10th April 2017
      ren vlcp.dll vlcp.exe
      :again
      vlcp -i "%~1" -hide_banner -loglevel -8 -report  
      shift      
      if "%~1" == "" goto:done
      goto:again
      echo.
      rem  
    :done
    ren ffplay*.log vlcp-4-Ali-*.log
    ren vlcp.exe vlcp.dll