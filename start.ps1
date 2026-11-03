# SmartQueue Canteen System - PowerShell Launcher
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "  Starting Smart Canteen and Waiting System" -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host ""

$root = $PSScriptRoot

Write-Host "[1/3] Starting Backend Server (Port 5000)..." -ForegroundColor Yellow
Start-Process cmd.exe -ArgumentList "/k cd /d `"$root\server`" && npm.cmd start"

Write-Host "Waiting for backend to initialize..." -ForegroundColor Gray
Start-Sleep -Seconds 3

Write-Host "[2/3] Starting Frontend Vite Server (Port 3000)..." -ForegroundColor Yellow
Start-Process cmd.exe -ArgumentList "/k cd /d `"$root\client`" && npm.cmd run dev"

Write-Host "Waiting for frontend to initialize..." -ForegroundColor Gray
Start-Sleep -Seconds 3

Write-Host "[3/3] Opening application in your default browser..." -ForegroundColor Green
Start-Process "http://localhost:3000"
Start-Process "http://localhost:3000/admin"

Write-Host ""
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "  Application launched successfully!" -ForegroundColor Green
Write-Host "  Student Portal: http://localhost:3000" -ForegroundColor White
Write-Host "  Admin Portal:   http://localhost:3000/admin" -ForegroundColor White
Write-Host "  Backend API:    http://localhost:5000/api/dashboard" -ForegroundColor White
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "Keep the backend and frontend terminal windows open." -ForegroundColor Gray
