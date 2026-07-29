[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

# Search terms related to today's topics: food, shopping, adjectives, clothes, places
$searchTerms = @(
    "たべもの", "Nomimono", "みせ", "みず", "おちゃ", "たべます", "のみます", 
    "たかい", "おもい", "かるい", "あたらしい", "あおい", "あかい",
    "ふく", "かばん", "ぼうし", "とけい", "デパート", "スーパー"
)

$foundNotes = @()

foreach ($term in $searchTerms) {
    $findReq = @{
        action = "findNotes"
        version = 6
        params = @{
            query = $term
        }
    } | ConvertTo-Json -Compress

    $ids = (Invoke-RestMethod -Uri "http://127.0.0.1:8765" -Method Post -Body $findReq -ContentType "application/json").result
    if ($ids.Count -gt 0) {
        $infoReq = @{
            action = "notesInfo"
            version = 6
            params = @{
                notes = $ids
            }
        } | ConvertTo-Json -Compress

        $info = (Invoke-RestMethod -Uri "http://127.0.0.1:8765" -Method Post -Body $infoReq -ContentType "application/json").result
        foreach ($item in $info) {
            $front = $item.fields.FrontText.value
            if (-not $front) { $front = $item.fields.Front.value }
            if (-not $front) { $front = $item.fields.Expression.value }
            
            $back = $item.fields.BackText.value
            if (-not $back) { $back = $item.fields.Back.value }
            if (-not $back) { $back = $item.fields.Meaning.value }

            if ($front -and $back) {
                $foundNotes += [PSCustomObject]@{
                    term = $term
                    front = $front
                    back = $back
                }
            }
        }
    }
}

$foundNotes | Unique | Export-Csv -Path "D:\data\para_wiki_llm\related_vocab.csv" -Encoding utf8 -NoTypeInformation
Write-Host "FOUND_$($foundNotes.Count)_RELATED_NOTES"
