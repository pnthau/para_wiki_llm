import os
import sys
from pydub import AudioSegment

if sys.platform == "win32":
    sys.stdout.reconfigure(encoding="utf-8")

audio_path = r"C:\Users\dc130\Downloads\u5_audio_listen_4.wav"
sound = AudioSegment.from_wav(audio_path)

exact_slices = [
    {
        "id": 1,
        "start": 3300,
        "end": 9100,
        "jp": "ガウィンさん、日曜日に桜公園でタイフェスティバルがありますね。行きますか？",
        "romaji": "Gawin-san, nichiyoubi ni Sakura kouen de Tai fesutibaru ga arimasu ne. Ikimasu ka?",
        "vn": "Anh Gawin ơi, Chủ nhật tuần này ở công viên Sakura có Lễ hội Thái Lan đấy. Anh có đi không?",
        "shadowing_pause": 5.0
    },
    {
        "id": 2,
        "start": 9600,
        "end": 10800,
        "jp": "はい、行きます。",
        "romaji": "Hai, ikimasu.",
        "vn": "Vâng, tôi sẽ đi.",
        "shadowing_pause": 2.0
    },
    {
        "id": 3,
        "start": 11100,
        "end": 12800,
        "jp": "楽しみですね。",
        "romaji": "Tanoshimi desu ne.",
        "vn": "Thật đáng mong đợi nhỉ!",
        "shadowing_pause": 2.5
    },
    {
        "id": 4,
        "start": 13500,
        "end": 15000,
        "jp": "そうですね。",
        "romaji": "Sou desu ne.",
        "vn": "Đúng vậy nhỉ!",
        "shadowing_pause": 2.0
    }
]

os.makedirs("u5_slices", exist_ok=True)
for item in exact_slices:
    chunk = sound[item["start"]:item["end"]]
    out_path = f"u5_slices/sentence_{item['id']}.wav"
    chunk.export(out_path, format="wav")
    print(f"Exported {out_path} (dur: {(item['end']-item['start'])/1000}s)")

print("All exact audio slices exported successfully!")
