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

Write-Host "TOTAL_NOTES_IN_U5: $($noteIds.Count)"

if ($noteIds.Count -gt 0) {
    $infoReq = @{
        action = "notesInfo"
        version = 6
        params = @{
            notes = $noteIds
        }
    } | ConvertTo-Json -Compress

    $notesInfo = (Invoke-RestMethod -Uri "http://127.0.0.1:8765" -Method Post -Body $infoReq -ContentType "application/json").result

    $result = foreach ($n in $notesInfo) {
        $props = $n.fields.PSObject.Properties
        $fieldsDict = [ordered]@{}
        foreach ($p in $props) {
            $fieldsDict[$p.Name] = $p.Value.value
        }
        
        [PSCustomObject]@{
            id = $n.id
            model = $n.modelName
            tags = ($n.tags -join ", ")
            fields = ($fieldsDict.GetEnumerator() | ForEach-Object { "$($_.Key): $($_.Value)" }) -join " || "
        }
    }

    $result | Export-Csv -Path "D:\data\para_wiki_llm\u5_notes_utf8.csv" -Encoding utf8 -NoTypeInformation
    Write-Host "EXPORTED_TO_CSV"
}
