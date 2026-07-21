import os
import wave
from pydub import AudioSegment

audio_path = r"C:\Users\dc130\Downloads\u5_audio_listen_4.wav"

sound = AudioSegment.from_wav(audio_path)

# Slices in milliseconds
slices = [
    {"id": 1, "start": 3400, "end": 9000, "jp": "ガウィンさん、日曜日に桜公園でタイフェスティバルがありますね。行きますか？", "vn": "Anh Gawin ơi, Chủ nhật tuần này ở công viên Sakura có Lễ hội Thái Lan đấy. Anh có đi không?"},
    {"id": 2, "start": 9700, "end": 11400, "jp": "はい、行きます。", "vn": "Vâng, tôi sẽ đi."},
    {"id": 3, "start": 12000, "end": 13700, "jp": "楽しみですね。", "vn": "Thật đáng mong đợi nhỉ!"},
    {"id": 4, "start": 14000, "end": 15800, "jp": "そうですね。", "vn": "Đúng vậy nhỉ!"}
]

os.makedirs("u5_slices", exist_ok=True)

for s in slices:
    chunk = sound[s["start"]:s["end"]]
    out_file = f"u5_slices/sentence_{s['id']}.wav"
    chunk.export(out_file, format="wav")
    print(f"Exported {out_file}: {s['jp']}")

print("All slices exported successfully.")
