#!/usr/bin/env pwsh
# QuickServe Web - Git & Vercel Setup Script
# Run this script to initialize git, configure remotes, and prepare for Vercel deployment

Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host "QuickServe Web - Setup & Deployment Script" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host ""

# Change to quickserve-web directory
Set-Location -Path "C:\Users\HP-PC\Desktop\quickserve-web" -ErrorAction Stop
Write-Host "✓ Working directory: $(Get-Location)" -ForegroundColor Green

# Step 1: Initialize git
Write-Host "`nStep 1: Initializing git repository..." -ForegroundColor Yellow
git init
git config user.name "QuickServe CI"
git config user.email "ci@quickserve.app"
Write-Host "✓ Git initialized" -ForegroundColor Green

# Step 2: Add GitHub remote
Write-Host "`nStep 2: Adding GitHub remote..." -ForegroundColor Yellow
$token = "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"
$remoteUrl = "https://$token@github.com/getquickserve-lab/quickserve-web.git"
git remote add origin $remoteUrl
Write-Host "✓ Remote added: github.com/getquickserve-lab/quickserve-web" -ForegroundColor Green

# Step 3: Stage all files
Write-Host "`nStep 3: Staging files..." -ForegroundColor Yellow
git add .
git status
Write-Host "✓ Files staged" -ForegroundColor Green

# Step 4: Create initial commit
Write-Host "`nStep 4: Creating initial commit..." -ForegroundColor Yellow
git commit -m "Initial commit: QuickServe Web monorepo with Turbo & Vercel config"
Write-Host "✓ Commit created" -ForegroundColor Green

# Step 5: Rename branch to main (if needed)
Write-Host "`nStep 5: Setting main branch..." -ForegroundColor Yellow
git branch -M main
Write-Host "✓ Branch renamed to main" -ForegroundColor Green

# Step 6: Push to GitHub
Write-Host "`nStep 6: Pushing to GitHub..." -ForegroundColor Yellow
git push -u origin main --force
Write-Host "✓ Pushed to GitHub" -ForegroundColor Green

# Step 7: Summary
Write-Host "`n=====================================================" -ForegroundColor Cyan
Write-Host "Setup Complete! ✓" -ForegroundColor Green
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next Steps:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Copy full app source code (if not done yet):" -ForegroundColor White
Write-Host "   xcopy c:\quickserve\apps\web-admin\src c:\quickserve-web\apps\web-admin\src /E /I /Y" -ForegroundColor Gray
Write-Host "   xcopy c:\quickserve\apps\web-consumer\src c:\quickserve-web\apps\web-consumer\src /E /I /Y" -ForegroundColor Gray
Write-Host "   xcopy c:\quickserve\apps\web-vendor\src c:\quickserve-web\apps\web-vendor\src /E /I /Y" -ForegroundColor Gray
Write-Host "   xcopy c:\quickserve\apps\web-rider\src c:\quickserve-web\apps\web-rider\src /E /I /Y" -ForegroundColor Gray
Write-Host ""
Write-Host "2. Install dependencies:" -ForegroundColor White
Write-Host "   cd c:\quickserve-web" -ForegroundColor Gray
Write-Host "   pnpm install" -ForegroundColor Gray
Write-Host ""
Write-Host "3. Deploy backend to Render.com:" -ForegroundColor White
Write-Host "   https://render.com/docs/deploy-node-express-app" -ForegroundColor Gray
Write-Host ""
Write-Host "4. Connect repo to Vercel:" -ForegroundColor White
Write-Host "   https://vercel.com/new" -ForegroundColor Gray
Write-Host "   - Select: github.com/getquickserve-lab/quickserve-web" -ForegroundColor Gray
Write-Host "   - Set NEXT_PUBLIC_API_URL to your backend URL" -ForegroundColor Gray
Write-Host ""
Write-Host "Repository: https://github.com/getquickserve-lab/quickserve-web" -ForegroundColor Cyan
Write-Host ""

Read-Host "Press Enter to exit"
