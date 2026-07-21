# -*- coding: utf-8 -*-
"""
🎧 NEJ Unit 5 - Audio Shadowing Terminal App
File đầu vào: C:\\Users\\dc130\\Downloads\\u5_audio_listen_4.mp3 (hoặc .wav)
Lệnh thực thi: py u5_audio_listen_4.py
"""

import os
import sys
import time
import winsound
from pydub import AudioSegment

# Reconfigure stdout to UTF-8 for Windows PowerShell
if sys.platform == "win32":
    sys.stdout.reconfigure(encoding="utf-8")

# Keyboard input helper (msvcrt for Windows non-blocking key press)
try:
    import msvcrt
    HAS_MSVCRT = True
except ImportError:
    HAS_MSVCRT = False

# Source Audio Paths
MP3_PATH = r"C:\Users\dc130\Downloads\u5_audio_listen_4.mp3"
WAV_PATH = r"C:\Users\dc130\Downloads\u5_audio_listen_4.wav"
SLICES_DIR = os.path.join(os.path.dirname(__file__), "u5_slices")

# Precise 5-Sentence Data Matrix matching Audio 100%
LESSON_DATA = [
    {
        "id": 1,
        "start": 3300,
        "end": 8800,
        "jp": "ガウィンさん、日曜日に桜公園でタイフェスティバルがありますね。",
        "romaji": "Gawin-san, nichiyoubi ni Sakura kouen de Tai fesutibaru ga arimasu ne.",
        "vn": "Anh Gawin ơi, Chủ nhật tuần này ở công viên Sakura có Lễ hội Thái Lan đấy nhỉ.",
        "shadowing_pause": 4.5
    },
    {
        "id": 2,
        "start": 8800,
        "end": 10800,
        "jp": "行きますか？",
        "romaji": "Ikimasu ka?",
        "vn": "Anh có đi không?",
        "shadowing_pause": 2.0
    },
    {
        "id": 3,
        "start": 10800,
        "end": 12800,
        "jp": "はい、行きます。",
        "romaji": "Hai, ikimasu.",
        "vn": "Vâng, tôi sẽ đi.",
        "shadowing_pause": 2.0
    },
    {
        "id": 4,
        "start": 12800,
        "end": 14500,
        "jp": "楽しみですね。",
        "romaji": "Tanoshimi desu ne.",
        "vn": "Thật đáng mong đợi nhỉ!",
        "shadowing_pause": 2.5
    },
    {
        "id": 5,
        "start": 14500,
        "end": 16200,
        "jp": "そうですね。",
        "romaji": "Sou desu ne.",
        "vn": "Đúng vậy nhỉ!",
        "shadowing_pause": 2.0
    }
]

def clear_screen():
    os.system("cls" if os.name == "nt" else "clear")

def prepare_audio_slices():
    """Tự động phân tách audio thành 5 file wav nhỏ chính xác 100%"""
    os.makedirs(SLICES_DIR, exist_ok=True)
    source_file = WAV_PATH if os.path.exists(WAV_PATH) else MP3_PATH

    if not os.path.exists(source_file):
        print(f"❌ Không tìm thấy file âm thanh đầu vào: {source_file}")
        sys.exit(1)

    fmt = "wav" if source_file.endswith(".wav") else "mp3"
    sound = AudioSegment.from_file(source_file, format=fmt)

    for item in LESSON_DATA:
        out_wav = os.path.join(SLICES_DIR, f"sentence_{item['id']}.wav")
        chunk = sound[item["start"]:item["end"]]
        chunk.export(out_wav, format="wav")

def play_audio(sentence_id):
    """Phát âm thanh câu được chọn"""
    wav_file = os.path.join(SLICES_DIR, f"sentence_{sentence_id}.wav")
    if os.path.exists(wav_file):
        winsound.PlaySound(wav_file, winsound.SND_FILENAME)

def run_shadowing_session(item):
    """Màn hình Cấp 2: Phát Audio + Luyện Shadowing câu được chọn"""
    while True:
        clear_screen()
        print("=" * 70)
        print(f" 🎧 NEJ UNIT 5 - CÂU {item['id']} / {len(LESSON_DATA)} [SHADOWING MODE]")
        print("=" * 70)
        print(f"\n 🇯🇵 TIẾNG NHẬT:  {item['jp']}")
        print(f" 🔤 ROMAJI:      {item['romaji']}")
        print(f" 🇻🇳 TIẾNG VIỆT:  {item['vn']}\n")
        print("-" * 70)
        print(" 🔊 ĐANG PHÁT AUDIO BẢN XỨ...")
        
        # Phát âm thanh chuẩn
        play_audio(item["id"])
        
        print("\n 🎙️ HÃY ĐỌC NHẠI THEO (SHADOWING)! ")
        pause_sec = int(item["shadowing_pause"])
        for sec in range(pause_sec, 0, -1):
            print(f"    --> Đếm ngược thời gian nhại giọng: ⏳ {sec}s ", end="\r", flush=True)
            time.sleep(1)
        print("    --> ⏱️ Hết thời gian nhại giọng!                           \n")
        print("-" * 70)
        print(" 🕹️ ĐIỀU KHIỂN:")
        print("    [ENTER] : Phát lại âm thanh & Luyện Shadowing lại")
        print("    [B]     : Quay lại Menu chính để chọn câu khác")
        print("=" * 70)
        print("\n👉 Lựa chọn của bạn (ENTER / B): ", end="", flush=True)

        if HAS_MSVCRT:
            while True:
                ch = msvcrt.getch()
                if ch in (b'\r', b'\n'):
                    break # Replay
                elif ch in (b'b', b'B'):
                    return # Back to main menu
        else:
            choice = input().strip().lower()
            if choice == 'b':
                return

def main_menu():
    """Màn hình Cấp 1: Menu Chính lựa chọn câu"""
    prepare_audio_slices()

    while True:
        clear_screen()
        print("=" * 70)
        print(" 🇯🇵 N5 ORAL SHADOWING TUTOR - NEJ UNIT 5 LISTENING 4")
        print(" 🎯 Target: Làm việc tại Nhật | Luyện nghe phản xạ Tiếng Nhật N5+")
        print("=" * 70)
        print("\n 📋 DANH SÁCH CÂU LUYỆN SHADOWING:\n")
        for item in LESSON_DATA:
            print(f"  [{item['id']}] {item['jp']}")
            print(f"      (👉 {item['vn']})\n")
        print("-" * 70)
        print(f" 🕹️ Bấm phím số [1-{len(LESSON_DATA)}] để chọn câu tương ứng | Bấm [Q] để thoát")
        print("=" * 70)
        print("\n👉 Nhập lựa chọn của bạn: ", end="", flush=True)

        if HAS_MSVCRT:
            ch = msvcrt.getch()
            try:
                char = ch.decode("utf-8").lower()
            except Exception:
                continue

            if char in ("q", "\x1b"):
                print("\n\n👋 Chúc John (Hau-san) ôn tập hiệu quả và sớm đạt mục tiêu sang Nhật!")
                break
            elif char.isdigit():
                num = int(char)
                matched = [item for item in LESSON_DATA if item["id"] == num]
                if matched:
                    run_shadowing_session(matched[0])
        else:
            user_input = input().strip().lower()
            if user_input == 'q':
                break
            elif user_input.isdigit():
                num = int(user_input)
                matched = [item for item in LESSON_DATA if item["id"] == num]
                if matched:
                    run_shadowing_session(matched[0])

if __name__ == "__main__":
    main_menu()
