[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

$findReq = @{
    action = "findNotes"
    version = 6
    params = @{
        query = "deck:`"nix::u5*`""
    }
} | ConvertTo-Json -Compress

$noteIds = (Invoke-RestMethod -Uri "http://127.0.0.1:8765" -Method Post -Body $findReq -ContentType "application/json").result

if ($noteIds.Count -gt 0) {
    $addTagReq = @{
        action = "addTags"
        version = 6
        params = @{
            notes = $noteIds
            tags = "n5_u5_focus"
        }
    } | ConvertTo-Json -Compress

    $res = Invoke-RestMethod -Uri "http://127.0.0.1:8765" -Method Post -Body $addTagReq -ContentType "application/json"
    Write-Host "TAGGED_$($noteIds.Count)_NOTES_WITH_n5_u5_focus"
}
