$cards = @(
    @("味", "Aji - Vị (của món ăn)"),
    @("薄い", "Usui - Nhạt, mỏng (Tính từ i)"),
    @("美味しい", "Oishii - Ngon (Tính từ i)"),
    @("甘い", "Amai - Ngọt (Tính từ i)"),
    @("辛い", "Karai - Cay (Tính từ i)"),
    @("ケーキ", "Keeki - Bánh kem"),
    @("カレー", "Karee - Món cà ri"),
    @("中華の店", "Chuuka no mise - Quán ăn Trung Hoa"),
    @("カフェ", "Kafe - Quán cà phê"),
    @("お腹", "Onaka - Cái bụng"),
    @("友達", "Tomodachi - Bạn bè"),
    @("ストライプ", "Sutoraipu - Kẻ sọc (Stripe)"),
    @("シャツ", "Shatsu - Áo sơ mi (Shirt)"),
    @("靴", "Kutsu - Giày"),
    @("食器", "Shokki - Bát đĩa, dụng cụ ăn uống"),
    @("ポーチ", "Poochi - Túi nhỏ, túi trang điểm (Pouch)"),
    @("ボールペン", "Boorupen - Bút bi (Ball-point pen)"),
    @("可愛い", "Kawaii - Dễ thương (Tính từ i)"),
    @("小さい", "Chiisai - Nhỏ (Tính từ i)"),
    @("安い", "Yasui - Rẻ (Tính từ i)"),
    @("ショッピングモール", "Shoppingu mooru - Trung tâm thương mại"),
    @("本当に", "Hontou ni - Thật sự (Phó từ)"),
    @("広い", "Hiroi - Rộng lớn (Tính từ i)"),
    @("大きい", "Ookii - To lớn (Tính từ i)"),
    @("素敵な", "Sutekina - Tuyệt vời, sang trọng (Tính từ Na)"),
    @("綺麗な", "Kireina - Đẹp, sạch sẽ (Tính từ Na)")
)

$deckName = "N5_Tap_Kich"

try {
    # 1. Create Deck
    $createDeckBody = @{
        action = "createDeck"
        version = 6
        params = @{
            deck = $deckName
        }
    } | ConvertTo-Json -Depth 10 -Compress

    Write-Host "Creating deck..."
    $res1 = Invoke-RestMethod -Uri "http://127.0.0.1:8765" -Method Post -Body $createDeckBody -ContentType "application/json"
    Write-Host ($res1 | ConvertTo-Json)

    # 2. Add Notes
    $notes = @()
    foreach ($card in $cards) {
        $note = @{
            deckName = $deckName
            modelName = "Basic"
            fields = @{
                Front = $card[0]
                Back = $card[1]
            }
            options = @{
                allowDuplicate = $false
            }
            tags = @("N5", "TapKich")
        }
        $notes += $note
    }

    $addNotesBody = @{
        action = "addNotes"
        version = 6
        params = @{
            notes = $notes
        }
    } | ConvertTo-Json -Depth 10 -Compress

    Write-Host "Adding notes..."
    $res2 = Invoke-RestMethod -Uri "http://127.0.0.1:8765" -Method Post -Body $addNotesBody -ContentType "application/json"
    Write-Host ($res2 | ConvertTo-Json)
    
    Write-Host "DONE_SUCCESS"
} catch {
    Write-Host "ERROR: $($_.Exception.Message)"
}
