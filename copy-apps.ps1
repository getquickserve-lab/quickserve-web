$ErrorActionPreference = "Continue"
$src = "c:\Users\HP-PC\Desktop\quickserve\apps"
$dst = "c:\Users\HP-PC\Desktop\quickserve-web\apps"

Write-Host "Starting copy operation..." -ForegroundColor Cyan

foreach ($app in @("web-admin", "web-consumer", "web-vendor", "web-rider")) {
    $sourceApp = Join-Path $src $app
    $destApp = Join-Path $dst $app
    
    Write-Host "Copying $app from $sourceApp to $destApp" -ForegroundColor Yellow
    
    if (Test-Path $sourceApp) {
        robocopy $sourceApp $destApp /S /E /XD node_modules .next .vercel .git .vercel /XF "*.log" | Out-Null
        
        if ($LASTEXITCODE -le 1) {
            Write-Host "✓ $app copied successfully" -ForegroundColor Green
        } else {
            Write-Host "✗ Error copying $app (Exit code: $LASTEXITCODE)" -ForegroundColor Red
        }
    } else {
        Write-Host "✗ Source $sourceApp not found" -ForegroundColor Red
    }
}

Write-Host "Copy operation complete!" -ForegroundColor Green
Get-ChildItem $dst -Directory | ForEach-Object { Write-Host "  - $_" -ForegroundColor Cyan }
