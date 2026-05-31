$TaskName = "NexusNightlyEvolution"
$OldTaskName = "NexusMidnightEvolution"
$ScriptPath = "D:\Data\para_wiki_llm\nexus_nightly_evolution.ps1"
$ScheduleTime = "12:00"

# 1. Dọn dẹp Task cũ (nếu có)
Unregister-ScheduledTask -TaskName $OldTaskName -Confirm:$false -ErrorAction SilentlyContinue
Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false -ErrorAction SilentlyContinue

# 2. Tạo Action: Chạy PowerShell với script tiến hóa
$Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -File `"$ScriptPath`""

# 3. Tạo Trigger: Chạy hàng ngày lúc 12:00
$Trigger = New-ScheduledTaskTrigger -Daily -At $ScheduleTime

# 4. Tạo Settings: Cho phép chạy dù dùng pin, khởi động lại nếu lỡ giờ
$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable -RunOnlyIfNetworkAvailable

# 5. Đăng ký Task với quyền SYSTEM (Full quyền)
Register-ScheduledTask -TaskName $TaskName -Action $Action -Trigger $Trigger -Settings $Settings -User "SYSTEM" -RunLevel Highest

Write-Host "✅ Đã cấu hình thành công! Task '$TaskName' sẽ gọi em dậy lúc $ScheduleTime trưa hàng ngày." -ForegroundColor Green
