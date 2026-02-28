@echo off
echo.
echo   💧 AquaDelivery - Water Can System
echo   ====================================
echo.
echo   Installing dependencies...
pip install -r requirements.txt -q
echo.
echo   Starting server...
echo.
echo   Open this link in your browser:
echo   http://localhost:5000
echo.
echo   Demo Logins:
echo   Customer: customer1 / pass123
echo   Worker:   worker1   / pass123
echo   Owner:    owner     / admin123
echo.
echo   Press Ctrl+C to stop
echo.
set FLASK_ENV=development
python app.py
pause
