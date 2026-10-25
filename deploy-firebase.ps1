Write-Host "=================================================" -ForegroundColor Cyan
Write-Host "       TRUSTVAULT — FIREBASE HOSTING DEPLOY       " -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan

Write-Host "`n[1/3] Compiling production build with Vite..." -ForegroundColor Yellow
npm run build
if ($LASTEXITCODE -ne 0) {
    Write-Host "`n[ERROR] Production build failed. Aborting deployment." -ForegroundColor Red
    exit 1
}

Write-Host "`n[2/3] Authenticating with Google / Firebase..." -ForegroundColor Yellow
npx firebase login

Write-Host "`n[3/3] Deploying TrustVault to Firebase Hosting..." -ForegroundColor Yellow
npx firebase deploy --only hosting

Write-Host "`n[SUCCESS] TrustVault is now live on Firebase Hosting!" -ForegroundColor Green
