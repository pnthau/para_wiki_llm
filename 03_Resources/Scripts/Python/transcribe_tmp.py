import whisper
import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

model = whisper.load_model('base')
audio_path = r"C:\Users\dc130\Downloads\u5_audio_listen_4.mp3"
result = model.transcribe(audio_path, language='ja')

print("FULL TEXT:", result['text'])
print("\nSEGMENTS:")
segments_data = []
for seg in result['segments']:
    print(f"{seg['start']:.2f}s - {seg['end']:.2f}s: {seg['text']}")
    segments_data.append({
        "start": round(seg['start'], 2),
        "end": round(seg['end'], 2),
        "text": seg['text'].strip()
    })

with open("u5_segments.json", "w", encoding="utf-8") as f:
    json.dump(segments_data, f, ensure_ascii=False, indent=2)

print("\nSaved to u5_segments.json")
