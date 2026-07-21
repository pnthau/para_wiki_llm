import sys
from pydub import AudioSegment
from pydub.silence import detect_nonsilent

if sys.platform == "win32":
    sys.stdout.reconfigure(encoding="utf-8")

audio_path = r"C:\Users\dc130\Downloads\u5_audio_listen_4.wav"
sound = AudioSegment.from_wav(audio_path)

print(f"Total duration: {len(sound)} ms ({len(sound)/1000:.2f} s)")

# Test different silence parameters
for thresh in [-30, -35, -40, -45]:
    for min_len in [300, 400, 500]:
        chunks = detect_nonsilent(sound, min_silence_len=min_len, silence_thresh=thresh)
        print(f"thresh={thresh}dB, min_len={min_len}ms -> Found {len(chunks)} chunks:")
        for idx, (start, end) in enumerate(chunks, 1):
            print(f"   Chunk {idx}: {start}ms - {end}ms (dur: {(end-start)/1000:.2f}s)")
        print("-" * 50)
