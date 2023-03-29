Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

$ErrorActionPreference = "Stop"

Install-Module -Name GoogleChrome.RemoteDesktop

Import-Module -Name GoogleChrome.RemoteDesktop

Install-Crd -Verbose

Set-CrdConfiguration -Verbose -AutoGenerateConfig

Set-CrdConfiguration -Verbose -EnableCredSSP -Role "Gateway"

Add-NetFirewallRule -DisplayName "Allow Chrome Remote Desktop" -Direction Inbound -LocalPort 3389 -Protocol TCP -Action Allow
