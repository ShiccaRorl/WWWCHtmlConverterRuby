@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
@"C:\rumix\ruby\2.3\x64-mingw32\bin\ruby.exe" "C:/Users/ban/Dropbox/Program/eclipse/Ruby/WWWCHtmlConverter/vendor/bundle/ruby/2.3.0/bin/WWWCHtmlConverter" %1 %2 %3 %4 %5 %6 %7 %8 %9
GOTO :EOF
:WinNT
@"C:\rumix\ruby\2.3\x64-mingw32\bin\ruby.exe" "%~dpn0" %*
