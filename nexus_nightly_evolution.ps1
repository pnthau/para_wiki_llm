# Nexus Noon Evolution Automation Script v8.2
# This script triggers the Gemini CLI and executes the Noon Evolution Protocol.
# SAFETY UPGRADE: Only runs if the computer is connected to AC power.

$ProjectDir = "D:\Data\para_wiki_llm"
Set-Location $ProjectDir
$LogFile = "D:\Data\para_wiki_llm\log_evolution.md"
"---`n[$(Get-Date)] Execution started." | Out-File -FilePath $LogFile -Append

# 🛡️ Hardware Safety Check
$BatteryStatus = Get-WmiObject -Class Win32_Battery
$PowerPluggedIn = (Get-WmiObject -Class Win32_PortableBattery).Status # Simplified check
# Professional check using BatteryStatus
$Battery = Get-CimInstance -ClassName Win32_Battery
if ($Battery) {
    if ($Battery.BatteryStatus -ne 2) { # 2 means "Sạc/Cắm nguồn AC"
        Write-Host "⚠️ Warning: Computer is on Battery power. Aborting evolution to prevent overheating/drain."
        exit
    }
}

# 🚀 Power confirmed. Starting Nexus Singularity Evolution...
$GeminiPath = "C:\Users\dc130\AppData\Roaming\npm\gemini.cmd"

# Execute Gemini CLI with the evolution command using absolute path
& $GeminiPath "Execute Nexus Singularity Nightly Evolution v8.0 according to [[Midnight_Evolution_Protocol]]. Use all remaining quota for web research, agent upgrades, and vault cleanup. Exit when finished."
