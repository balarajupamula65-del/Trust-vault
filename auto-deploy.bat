@echo off
title TrustVault - Firebase Hosting One-Click Deployment
color 0A
cd /d "%~dp0"

echo ==========================================================
echo        TRUSTVAULT - AUTOMATED FIREBASE DEPLOYMENT
echo ==========================================================
echo.
echo [1/3] Building production bundle...
call npm run build
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Build failed.
    pause
    exit /b 1
)

echo.
echo [2/3] Authenticating with Google / Firebase...
echo (A browser window will open. Click 'Allow' to authorize).
echo.
call npx firebase login

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [ERROR] Login was not completed.
    pause
    exit /b 1
)

echo.
echo [3/3] Deploying TrustVault to Firebase Hosting...
echo.
call npx firebase deploy --only hosting

echo.
echo ==========================================================
echo [SUCCESS] TrustVault is now live on Firebase Hosting!
echo ==========================================================
pause
