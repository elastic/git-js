# Abort with non zero exit code on errors
$ErrorActionPreference = "Stop"

Write-Host "List environment variables..."
Get-ChildItem Env: | Sort Name | Format-Table -Wrap -AutoSize

Write-Host "Getting latest Nodejs version..."
$Version = $(choco list nodejs --by-id-only --all) | Select-String -Pattern "nodejs $env:NODE_VERSION" | %{$_.ToString().split(" ")[1]} | sort {[version] $_} | Select-Object -Last 1

Write-Host "Installing Nodejs..."
& choco install nodejs --no-progress -y --version "$Version"

Write-Host "Installing Yarn..."
& choco install yarn --no-progress -y --version "1.19.1"