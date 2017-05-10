@echo off
REM created by Ali Lakhwaira - conversion that conforms to GTI's boundaries 5th April 2017
      ren vlc.dll vlc.exe
      :again
      vlc -i "%~1" -t 60 -hide_banner -loglevel 32 -report -c:v libx265 -preset slower -crf 20 -c:a copy "1_MIN_TEST_%~n1.mp4"  
      shift      
      if "%~1" == "" goto:done
      goto:again
      echo.
      rem  
    :done
    ren ffmpeg*.log vlc-connect-*.log
    ren vlc.exe vlc.dll