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
    $infoReq = @{
        action = "notesInfo"
        version = 6
        params = @{
            notes = $noteIds
        }
    } | ConvertTo-Json -Compress

    $notesInfo = (Invoke-RestMethod -Uri "http://127.0.0.1:8765" -Method Post -Body $infoReq -ContentType "application/json").result

    $deleteIds = @()

    foreach ($n in $notesInfo) {
        $tagStr = $n.tags -join " "
        $front = $n.fields.FrontText.value
        $back = $n.fields.BackText.value

        # Check subdeck / tags or text for redundant conjugated forms
        $isConjugated = $false

        # Subdecks like "nix::u5::Tính từ::Đuôi i::Phủ Định::HTTL" or "QK" or "Phủ định"
        if ($tagStr -match "QK" -or $tagStr -match "Phủ" -or $tagStr -match "HTTL" -or $tagStr -match "khẳng, định") {
            # If front/back is a conjugated variation (e.g. ちいさい です, くろ かったです, くろくないです, etc.)
            if ($front -match "です" -or $front -match "でした" -or $front -match "ませんでした" -or $front -match "なかった" -or $front -match "くない") {
                $isConjugated = $true
            }
            if ($back -match "Đã" -or $back -match "không" -or $back -match "Đã từng") {
                $isConjugated = $true
            }
        }

        # Catch explicit endings
        if ($front -match "でした" -or $front -match "ませんでした" -or $front -match "かった" -or $front -match "くない") {
            $isConjugated = $true
        }

        if ($isConjugated) {
            $deleteIds += $n.noteId
        }
    }

    Write-Host "FOUND_$($deleteIds.Count)_NOTES_TO_DELETE out of $($noteIds.Count) total notes."

    if ($deleteIds.Count -gt 0) {
        $delReq = @{
            action = "deleteNotes"
            version = 6
            params = @{
                notes = $deleteIds
            }
        } | ConvertTo-Json -Compress

        $res = Invoke-RestMethod -Uri "http://127.0.0.1:8765" -Method Post -Body $delReq -ContentType "application/json"
        Write-Host "DELETED_SUCCESSFULLY: $($res | ConvertTo-Json)"
    }
}
