@echo off
title SmartQueue Canteen System Launcher
echo ========================================================
echo   Starting Smart Canteen and Waiting System
echo ========================================================
echo.

echo [1/3] Starting Backend Server (Port 5000)...
start "SmartQueue Backend (Port 5000)" cmd /k "cd /d %~dp0server && npm.cmd start"

echo Waiting for backend to initialize...
timeout /t 3 /nobreak >nul

echo [2/3] Starting Frontend Vite Server (Port 3000)...
start "SmartQueue Frontend (Port 3000)" cmd /k "cd /d %~dp0client && npm.cmd run dev"

echo Waiting for frontend to initialize...
timeout /t 3 /nobreak >nul

echo [3/3] Opening application in your default browser...
start http://localhost:3000
start http://localhost:3000/admin

echo.
echo ========================================================
echo   Application launched successfully!
echo   Student Portal: http://localhost:3000
echo   Admin Portal:   http://localhost:3000/admin
echo   Backend API:    http://localhost:5000/api/dashboard
echo ========================================================
echo.
echo Keep the backend and frontend terminal windows open.
pause
