import sys
import json
import whisper

if sys.platform == "win32":
    sys.stdout.reconfigure(encoding="utf-8")

print("Loading Whisper model...")
model = whisper.load_model("small")

audio_path = r"C:\Users\dc130\Downloads\u5_audio_listen_4.mp3"
result = model.transcribe(audio_path, language="ja")

output = {
    "text": result["text"],
    "segments": [
        {
            "id": i + 1,
            "start": round(seg["start"], 2),
            "end": round(seg["end"], 2),
            "text": seg["text"].strip()
        }
        for i, seg in enumerate(result["segments"])
    ]
}

with open("real_script.json", "w", encoding="utf-8") as f:
    json.dump(output, f, ensure_ascii=False, indent=2)

print("Transcription saved to real_script.json")
