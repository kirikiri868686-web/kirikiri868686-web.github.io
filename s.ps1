Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Start-Service sshd
Set-Service -Name sshd -StartupType Automatic
New-Item -Path C:\ProgramData\ssh -ItemType Directory -Force | Out-Null
Set-Content -Path C:\ProgramData\ssh\administrators_authorized_keys -Value 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAZW0nv/HXa/3vV7ZsSpUP3MfCS8w+R11U9A40dkb3YI hatch' -Encoding ascii
icacls C:\ProgramData\ssh\administrators_authorized_keys /inheritance:r /grant "Administrators:F" /grant "SYSTEM:F"
Write-Host "SETUP DONE"
whoami
