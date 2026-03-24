@echo off
REM QuickServe Web - Setup Script (Windows Batch)
REM Run this script to initialize git and push to GitHub

title QuickServe Web - Setup & Deployment

echo.
echo =====================================================
echo QuickServe Web - Setup ^& Deployment Script
echo =====================================================
echo.

cd /d C:\Users\HP-PC\Desktop\quickserve-web
echo Working directory: %CD%
echo.

REM Step 1: Initialize git
echo Step 1: Initializing git repository...
call git init
call git config user.name "QuickServe CI"
call git config user.email "ci@quickserve.app"
echo [OK] Git initialized
echo.

REM Step 2: Add GitHub remote
echo Step 2: Adding GitHub remote...
set "token=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"
call git remote add origin https://%token%@github.com/getquickserve-lab/quickserve-web.git
echo [OK] Remote added: github.com/getquickserve-lab/quickserve-web
echo.

REM Step 3: Stage all files
echo Step 3: Staging files...
call git add .
echo [OK] Files staged
echo.

REM Step 4: Create initial commit
echo Step 4: Creating initial commit...
call git commit -m "Initial commit: QuickServe Web monorepo with Turbo and Vercel config"
echo [OK] Commit created
echo.

REM Step 5: Set main branch
echo Step 5: Setting main branch...
call git branch -M main
echo [OK] Branch set to main
echo.

REM Step 6: Push to GitHub
echo Step 6: Pushing to GitHub...
call git push -u origin main --force
echo [OK] Pushed to GitHub
echo.

echo =====================================================
echo Setup Complete!
echo =====================================================
echo.
echo Next Steps:
echo.
echo 1. Copy full app source code (if not done yet):
echo    xcopy c:\quickserve\apps\web-admin\src c:\quickserve-web\apps\web-admin\src /E /I /Y
echo    xcopy c:\quickserve\apps\web-consumer\src c:\quickserve-web\apps\web-consumer\src /E /I /Y
echo    xcopy c:\quickserve\apps\web-vendor\src c:\quickserve-web\apps\web-vendor\src /E /I /Y
echo    xcopy c:\quickserve\apps\web-rider\src c:\quickserve-web\apps\web-rider\src /E /I /Y
echo.
echo 2. Install dependencies:
echo    cd c:\quickserve-web
echo    pnpm install
echo.
echo 3. Deploy backend to Render.com:
echo    https://render.com/docs/deploy-node-express-app
echo.
echo 4. Connect repo to Vercel:
echo    https://vercel.com/new
echo    Select: github.com/getquickserve-lab/quickserve-web
echo    Set NEXT_PUBLIC_API_URL to backend URL
echo.
echo Repository: https://github.com/getquickserve-lab/quickserve-web
echo.

pause
