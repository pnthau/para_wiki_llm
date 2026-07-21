# -*- coding: utf-8 -*-
"""
🎧 Shadowing Tutor - Ứng dụng Luyện nghe & Nhại giọng Tiếng Nhật
====================================================================
Cách dùng:
  - Chế độ Tự động (AI Whisper):   py auto_tutor.py "file_audio.mp3"
  - Chế độ Script chuẩn (Giáo trình): py auto_tutor.py --script "script.json" "file_audio.mp3"

Tính năng:
  - Tự động cắt câu bằng AI Whisper
  - Tự động dịch Nhật -> Việt
  - Hỗ trợ override script chuẩn từ file JSON (khi AI dịch sai)
  - Shadowing với đếm ngược nhại giọng
  - Menu phím số 1/2/3..., ENTER phát lại, B quay lại menu
"""

import os
import sys
import json
import time
import argparse
import urllib.request
import urllib.parse
import winsound
import whisper
from pydub import AudioSegment

if sys.platform == "win32":
    sys.stdout.reconfigure(encoding="utf-8")

try:
    import msvcrt
    HAS_MSVCRT = True
except ImportError:
    HAS_MSVCRT = False


# ─────────────────────────────────────────────────────────────────────
# TRANSLATION ENGINE
# ─────────────────────────────────────────────────────────────────────
def translate_ja_to_vi(text):
    """Dịch tiếng Nhật → tiếng Việt qua Google Translate API miễn phí"""
    if not text or not text.strip():
        return ""
    try:
        url = ("https://translate.googleapis.com/translate_a/single"
               "?client=gtx&sl=ja&tl=vi&dt=t&q=" + urllib.parse.quote(text))
        req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0"})
        res = urllib.request.urlopen(req, timeout=5)
        data = json.loads(res.read().decode("utf-8"))
        return "".join([item[0] for item in data[0] if item[0]])
    except Exception:
        return "[Không dịch được]"


# ─────────────────────────────────────────────────────────────────────
# AUDIO PROCESSING ENGINE (Whisper VAD)
# ─────────────────────────────────────────────────────────────────────
def process_audio_whisper(audio_path, model_size="small"):
    """Dùng AI Whisper cắt câu chính xác theo VAD, dịch từng câu sang tiếng Việt"""
    base_name = os.path.splitext(os.path.basename(audio_path))[0]
    cache_dir = os.path.join(os.path.dirname(__file__), "processed_cache", base_name)
    json_cache = os.path.join(cache_dir, "data.json")

    if os.path.exists(json_cache):
        print(f"⚡ Cache đã có cho '{base_name}', đang tải nhanh...")
        with open(json_cache, "r", encoding="utf-8") as f:
            return json.load(f), base_name

    print(f"⌛ Nạp AI Whisper ({model_size}) & phân tích file audio...")
    model = whisper.load_model(model_size)
    result = model.transcribe(audio_path, language="ja", fp16=False)

    os.makedirs(cache_dir, exist_ok=True)
    sound = AudioSegment.from_file(audio_path)

    sentences = []
    valid_id = 1
    print("🌐 Đang dịch tự động Nhật → Việt...")
    for seg in result["segments"]:
        text = seg["text"].strip()
        # Bỏ qua segment rác (chỉ là số, ký tự rỗng, hay quá ngắn < 1 giây)
        duration = seg["end"] - seg["start"]
        if not text or duration < 1.0 or (len(text) <= 2 and not any(c.isalpha() for c in text)):
            continue

        start_ms = int(seg["start"] * 1000)
        end_ms   = int(seg["end"]   * 1000)

        vn_text    = translate_ja_to_vi(text)
        slice_file = os.path.join(cache_dir, f"sentence_{valid_id}.wav")
        sound[start_ms:end_ms].export(slice_file, format="wav")

        sentences.append({
            "id":    valid_id,
            "start": start_ms,
            "end":   end_ms,
            "jp":    text,
            "vn":    vn_text,
            "file":  slice_file,
            "pause": max(2.0, round(duration + 1.0, 1)),
        })
        valid_id += 1

    with open(json_cache, "w", encoding="utf-8") as f:
        json.dump(sentences, f, ensure_ascii=False, indent=2)

    return sentences, base_name


# ─────────────────────────────────────────────────────────────────────
# SCRIPT OVERRIDE ENGINE (từ giáo trình / file JSON chuẩn)
# ─────────────────────────────────────────────────────────────────────
def load_script_override(script_path, audio_path):
    """
    Đọc file JSON script chuẩn (từ giáo trình) và cắt audio theo đúng timestamp.
    Format JSON:
    [
      { "jp": "ガウィンさん...", "vn": "Anh Gawin...", "start": 3300, "end": 8800 },
      ...
    ]
    """
    base_name = os.path.splitext(os.path.basename(audio_path))[0]
    cache_dir = os.path.join(os.path.dirname(__file__), "processed_cache", base_name + "_manual")
    os.makedirs(cache_dir, exist_ok=True)

    with open(script_path, "r", encoding="utf-8") as f:
        raw = json.load(f)

    sound = AudioSegment.from_file(audio_path)
    sentences = []

    for idx, item in enumerate(raw, 1):
        start_ms = item["start"]
        end_ms   = item["end"]
        duration = (end_ms - start_ms) / 1000.0

        slice_file = os.path.join(cache_dir, f"sentence_{idx}.wav")
        sound[start_ms:end_ms].export(slice_file, format="wav")

        sentences.append({
            "id":    idx,
            "start": start_ms,
            "end":   end_ms,
            "jp":    item.get("jp", ""),
            "vn":    item.get("vn", "[Chưa có bản dịch]"),
            "file":  slice_file,
            "pause": item.get("pause", max(2.0, round(duration + 1.0, 1))),
        })

    return sentences, base_name


# ─────────────────────────────────────────────────────────────────────
# TERMINAL UI
# ─────────────────────────────────────────────────────────────────────
def clear_screen():
    os.system("cls" if os.name == "nt" else "clear")


def play_sound_file(filepath):
    if os.path.exists(filepath):
        winsound.PlaySound(filepath, winsound.SND_FILENAME)


def get_key():
    """Lấy 1 phím bấm, trả về ký tự str (lowercase)"""
    if HAS_MSVCRT:
        ch = msvcrt.getch()
        try:
            return ch.decode("utf-8").lower()
        except Exception:
            return ""
    else:
        return input().strip().lower()


def run_shadowing(item, total):
    """Màn hình Cấp 2: phát audio + Shadowing countdown"""
    while True:
        clear_screen()
        print("=" * 68)
        print(f" 🎧  CÂU {item['id']} / {total}  —  SHADOWING MODE")
        print("=" * 68)
        print(f"\n  🇯🇵  {item['jp']}")
        print(f"  🇻🇳  {item['vn']}\n")
        print("-" * 68)
        print("  🔊 Đang phát audio bản xứ...")
        play_sound_file(item["file"])

        print("\n  🎙️  Đến lượt bạn nhại theo!")
        pause_sec = int(item["pause"])
        for sec in range(pause_sec, 0, -1):
            print(f"      ⏳ {sec}s còn lại...    ", end="\r", flush=True)
            time.sleep(1)
        print("      ✅ Hết giờ nhại giọng!            \n")

        print("-" * 68)
        print("  [ENTER]  Phát lại & Shadowing lại")
        print("  [B]      Quay về Menu chính")
        print("=" * 68)
        print("  👉 ", end="", flush=True)

        key = get_key()
        if key in ("b",):
            return
        # Mọi phím khác (Enter, ký tự lạ...) → phát lại


def main_menu(sentences, title):
    """Màn hình Cấp 1: danh sách câu"""
    total = len(sentences)
    while True:
        clear_screen()
        print("=" * 68)
        print(f"  🇯🇵  SHADOWING TUTOR  —  {title.upper()}")
        print("=" * 68)
        print(f"\n  📋  {total} câu luyện nghe:\n")
        for s in sentences:
            print(f"  [{s['id']}]  {s['jp']}")
            print(f"       {s['vn']}\n")
        print("-" * 68)
        print(f"  Bấm phím số [1–{total}] để vào câu  |  [Q] Thoát")
        print("=" * 68)
        print("  👉 ", end="", flush=True)

        key = get_key()
        if key in ("q", "\x1b"):
            print("\n\n  👋 Chúc luyện nghe hiệu quả! Cố lên John (Hau-san)! 🇯🇵")
            break
        elif key.isdigit():
            num = int(key)
            matched = [s for s in sentences if s["id"] == num]
            if matched:
                run_shadowing(matched[0], total)


# ─────────────────────────────────────────────────────────────────────
# ENTRY POINT
# ─────────────────────────────────────────────────────────────────────
def main():
    parser = argparse.ArgumentParser(
        description="🎧 Shadowing Tutor — luyện nghe tiếng Nhật trực tiếp trên terminal"
    )
    parser.add_argument(
        "audio",
        nargs="?",
        default=r"C:\Users\dc130\Downloads\u5_audio_listen_4.mp3",
        help="Đường dẫn file audio (.mp3 / .wav)",
    )
    parser.add_argument(
        "--script", "-s",
        default=None,
        help="Đường dẫn file script JSON chuẩn (để ghi đè kết quả AI Whisper)",
    )
    parser.add_argument(
        "--model", "-m",
        default="small",
        choices=["tiny", "base", "small", "medium", "large"],
        help="Kích thước model Whisper (mặc định: small)",
    )
    parser.add_argument(
        "--clear-cache", "-c",
        action="store_true",
        help="Xóa cache cũ và xử lý lại từ đầu",
    )
    args = parser.parse_args()

    if not os.path.exists(args.audio):
        print(f"❌ Không tìm thấy file audio: {args.audio}")
        sys.exit(1)

    # Xóa cache nếu có yêu cầu
    if args.clear_cache:
        base_name = os.path.splitext(os.path.basename(args.audio))[0]
        cache_json = os.path.join("processed_cache", base_name, "data.json")
        if os.path.exists(cache_json):
            os.remove(cache_json)
            print("🗑️  Đã xóa cache cũ.")

    if args.script:
        # Chế độ Script chuẩn từ giáo trình
        if not os.path.exists(args.script):
            print(f"❌ Không tìm thấy file script: {args.script}")
            sys.exit(1)
        sentences, title = load_script_override(args.script, args.audio)
        print(f"✅ Đã nạp script chuẩn: {len(sentences)} câu")
    else:
        # Chế độ Tự động AI Whisper
        sentences, title = process_audio_whisper(args.audio, model_size=args.model)
        print(f"✅ Đã phân tích xong: {len(sentences)} câu")

    time.sleep(0.5)
    main_menu(sentences, title)


if __name__ == "__main__":
    main()
