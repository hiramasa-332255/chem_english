@echo off
cd /d "%~dp0"

where py >nul 2>&1
if %errorlevel%==0 goto use_py

where python >nul 2>&1
if %errorlevel%==0 goto use_python

echo Python was not found.
echo Install Python or open this folder with VS Code Live Server.
pause
exit /b 1

:use_py
start "Chemistry Flashcards Server" /MIN py -m http.server 8765 --bind 127.0.0.1
goto open_page

:use_python
start "Chemistry Flashcards Server" /MIN python -m http.server 8765 --bind 127.0.0.1

:open_page
timeout /t 2 /nobreak >nul
start "" http://127.0.0.1:8765/chemistry_english_flashcards.html
exit /b 0
