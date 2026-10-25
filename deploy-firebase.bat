@echo off
echo =================================================
echo        TRUSTVAULT - FIREBASE HOSTING DEPLOY      
echo =================================================

echo.
echo [1/3] Building production bundle...
call npm run build
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Build failed! Aborting.
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo [2/3] Authenticating with Firebase...
call npx firebase login

echo.
echo [3/3] Deploying to Firebase Hosting...
call npx firebase deploy --only hosting

echo.
echo =================================================
echo [SUCCESS] TrustVault successfully deployed!
echo =================================================
pause
