# 🌀 NEXUS SINGULARITY EVOLUTION SCRIPT v9.0 (Auto-Schedule Edition)
# Author: Gemini Nexus & John (Hau-san)
# Description: Tự động hóa tiến hóa hệ thống, tự đăng ký Task Scheduler và quản lý tài nguyên.

$ProjectDir = "D:\Data\para_wiki_llm"
$LogFile = "$ProjectDir\log_evolution.md"
$TaskName = "NexusNightlyEvolution"
$GeminiPath = "C:\Users\dc130\AppData\Roaming\npm\gemini.cmd"
$ScheduleTime = "22:00"

# 1. Kiểm tra quyền Administrator (Cần để tạo Task)
$IsAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

Function Write-Log ($Message) {
    $TimeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "[$TimeStamp] $Message" | Out-File -FilePath $LogFile -Append
}

# 2. Cơ chế tự đăng ký Task Scheduler (Nếu có quyền Admin)
if ($IsAdmin) {
    $Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -WindowStyle Hidden -File `"$PSCommandPath`""
    $Trigger = New-ScheduledTaskTrigger -Daily -At $ScheduleTime
    $Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable -RunOnlyIfNetworkAvailable
    
    # Đăng ký hoặc cập nhật Task
    Register-ScheduledTask -TaskName $TaskName -Action $Action -Trigger $Trigger -Settings $Settings -Force -User "SYSTEM" -RunLevel Highest | Out-Null
    Write-Log "✅ Task Scheduler updated: Runs daily at $ScheduleTime (Hidden mode)."
} else {
    Write-Log "⚠️ Running without Admin: Task Scheduler was not updated."
}

# 3. Kiểm tra Nguồn điện (Hardware Safety)
$Battery = Get-CimInstance -ClassName Win32_Battery
if ($Battery -and $Battery.BatteryStatus -ne 2) {
    Write-Log "🚫 Aborted: Computer is on Battery power ($($Battery.EstimatedChargeRemaining)%)."
    exit
}

# 4. THỰC THI TIẾN HÓA (The Singularity Phase)
Write-Log "🚀 Starting Evolution Phase..."

try {
    # Chạy Gemini CLI và bắt toàn bộ Output/Error
    $EvolutionCommand = "Execute Nexus Singularity Nightly Evolution v8.0 according to [[Midnight_Evolution_Protocol]]. Use all remaining quota for web research, agent upgrades, and vault cleanup. Exit when finished."
    
    $Output = & $GeminiPath $EvolutionCommand 2>&1
    $Output | Out-File -FilePath $LogFile -Append
    
    Write-Log "🏆 Evolution completed successfully."
} catch {
    Write-Log "❌ FATAL ERROR: $($_.Exception.Message)"
}

Write-Log "--- End of Session ---"
