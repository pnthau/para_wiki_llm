[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

$findReq = @{
    action = "findNotes"
    version = 6
    params = @{
        query = "deck:`"nix::u6*`""
    }
} | ConvertTo-Json -Compress

$noteIds = (Invoke-RestMethod -Uri "http://127.0.0.1:8765" -Method Post -Body $findReq -ContentType "application/json").result

if ($noteIds.Count -gt 0) {
    $infoReq = @{
        action = "notesInfo"
        version = 6
        params = @{
            notes = $noteIds
        }
    } | ConvertTo-Json -Compress

    $notesInfo = (Invoke-RestMethod -Uri "http://127.0.0.1:8765" -Method Post -Body $infoReq -ContentType "application/json").result

    foreach ($n in $notesInfo) {
        $props = $n.fields.PSObject.Properties
        $fieldsDict = [ordered]@{}
        foreach ($p in $props) {
            $fieldsDict[$p.Name] = $p.Value.value
        }
        
        Write-Host "ID: $($n.noteId) | TAGS: $($n.tags -join ', ') | FIELDS: $($fieldsDict.GetEnumerator() | ForEach-Object { "$($_.Key): $($_.Value)" } | Select-Object -First 3)"
    }
}
