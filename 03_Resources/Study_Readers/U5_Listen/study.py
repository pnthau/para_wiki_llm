import os
import sys
import json
import time
import wave

# Reconfigure console encoding to UTF-8
if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8')
if hasattr(sys.stderr, 'reconfigure'):
    sys.stderr.reconfigure(encoding='utf-8')

# Import winsound on Windows for audio playback and beep
try:
    import winsound
    HAS_WINSOUND = True
except ImportError:
    HAS_WINSOUND = False

def clear_screen():
    os.system('cls' if os.name == 'nt' else 'clear')

def get_wav_duration(filepath):
    try:
        with wave.open(filepath, 'r') as f:
            frames = f.getnframes()
            rate = f.getframerate()
            duration = frames / float(rate)
            return duration
    except Exception:
        return 3.0  # Fallback duration if file cannot be read

def play_audio(filepath, async_mode=False):
    if not HAS_WINSOUND:
        print("⚠️ winsound is not available on this platform. Cannot play audio.")
        return
    if not os.path.exists(filepath):
        print(f"⚠️ Audio file not found: {filepath}")
        return
        
    flags = winsound.SND_FILENAME
    if async_mode:
        flags |= winsound.SND_ASYNC
    
    winsound.PlaySound(filepath, flags)

def play_beep():
    if HAS_WINSOUND:
        winsound.Beep(880, 200)  # 880Hz, 200ms
    else:
        print("\a", end="") # Terminal bell fallback

def print_dashboard():
    print("=" * 60)
    print(" 🇯🇵  N5 JAPANESE TERMINAL AUDIO STUDY READER - UNIT 5  🇯🇵")
    print("=" * 60)
    print(" Mục tiêu: Giao tiếp trôi chảy tiếng Nhật & Lập nghiệp tại Nhật Bản!")
    print(" Phương pháp: Shadowing từng câu & Occam's Razor tối giản")
    print("=" * 60)

def show_menu(sentences):
    clear_screen()
    print_dashboard()
    print("\n Danh sách các câu nghe hiểu Unit 5 (Sinh hoạt hàng ngày):")
    print("-" * 60)
    for s in sentences:
        print(f"  [{s['id']}] {s['text']}")
    print("-" * 60)
    print(" HƯỚNG DẪN ĐIỀU KHIỂN:")
    print("  • Nhập số (1-5): Nghe và xem giải thích chi tiết câu đó.")
    print("  • Nhập 's <số>' (Ví dụ: 's 1'): Luyện tập Shadowing câu đó.")
    print("  • Nhập 'a': Nghe toàn bộ 5 câu liên tục.")
    print("  • Nhập 'q': Thoát chương trình.")
    print("=" * 60)

def study_sentence(sentence):
    while True:
        clear_screen()
        print_dashboard()
        print(f"\n [CÂU HỌC TẬP CHỈ ĐỊNH: {sentence['id']}/5]")
        print("-" * 60)
        print(f" 🇯🇵 Tiếng Nhật : {sentence['text']}")
        print(f" 🗣️ Romaji     : {sentence['romaji']}")
        print(f" 🇻🇳 Bản dịch   : {sentence['translation']}")
        print("-" * 60)
        print(" 📚 Phân tích từ vựng & ngữ pháp:")
        for item in sentence['grammar']:
            print(f"  • {item}")
        print("-" * 60)
        
        print(" 🔊 Đang phát âm thanh gốc...")
        play_audio(sentence['audio_file'])
        
        print("\n [ĐIỀU KHIỂN]:")
        print("  • Nhấn [Enter] để NGHE LẠI câu này.")
        print("  • Nhập 'b' rồi nhấn [Enter] để QUAY LẠI menu chính.")
        
        choice = input("\n Lựa chọn của bạn: ").strip().lower()
        if choice == 'b':
            break

def shadow_sentence(sentence):
    clear_screen()
    print_dashboard()
    print(f"\n ⚡ CHẾ ĐỘ SHADOWING (NHẠI ÂM TẬP KÍCH) - CÂU {sentence['id']}/5")
    print("-" * 60)
    print(f" 🇯🇵 Tiếng Nhật : {sentence['text']}")
    print(f" 🗣️ Romaji     : {sentence['romaji']}")
    print(f" 🇻🇳 Bản dịch   : {sentence['translation']}")
    print("-" * 60)
    print(" HƯỚNG DẪN:")
    print("  1. Lắng nghe câu gốc đọc mẫu.")
    print("  2. Nghe tiếng BÍP báo hiệu.")
    print("  3. Đọc to và nhại theo đúng ngữ điệu ngay lập tức.")
    print("-" * 60)
    
    input(" Nhấn [Enter] để bắt đầu Shadowing...")
    
    while True:
        print("\n 👂 [1] Hãy nghe...")
        play_audio(sentence['audio_file'])
        
        print(" 🔔 [2] Chuẩn bị...")
        time.sleep(0.3)
        play_beep()
        
        duration = get_wav_duration(sentence['audio_file'])
        pause_duration = max(duration * 1.5, 2.0)
        
        print(" 🗣️ [3] ĐỌC TO THEO NÀO! (Shadowing)...")
        time.sleep(pause_duration)
        
        print("-" * 40)
        print(" [ĐIỀU KHIỂN SHADOWING]:")
        print("  • Nhấn [Enter] để LUYỆN LẠI câu này.")
        print("  • Nhập 'b' rồi nhấn [Enter] để QUAY LẠI menu chính.")
        
        choice = input("\n Lựa chọn của bạn: ").strip().lower()
        if choice == 'b':
            break
        clear_screen()
        print_dashboard()
        print(f"\n ⚡ CHẾ ĐỘ SHADOWING (NHẠI ÂM TẬP KÍCH) - CÂU {sentence['id']}/5")
        print("-" * 60)
        print(f" 🇯🇵 Tiếng Nhật : {sentence['text']}")
        print(f" 🗣️ Romaji     : {sentence['romaji']}")
        print(f" 🇻🇳 Bản dịch   : {sentence['translation']}")
        print("-" * 60)

def play_all(sentences):
    clear_screen()
    print_dashboard()
    print("\n 🔊 ĐANG PHÁT TOÀN BỘ 5 CÂU LIÊN TỤC...")
    print("-" * 60)
    for s in sentences:
        print(f" ▶️ Đang phát câu {s['id']}: {s['text']}")
        play_audio(s['audio_file'])
        time.sleep(1.0)
    print("-" * 60)
    input(" Phát xong! Nhấn [Enter] để quay lại menu...")

def main():
    json_path = os.path.join(os.path.dirname(__file__), "transcript.json")
    if not os.path.exists(json_path):
        print(f"⚠️ Không tìm thấy file transcript.json tại: {json_path}")
        return
        
    with open(json_path, 'r', encoding='utf-8') as f:
        sentences = json.load(f)
        
    while True:
        show_menu(sentences)
        choice = input("\n Nhập lệnh của bạn: ").strip().lower()
        
        if choice == 'q':
            clear_screen()
            print("=" * 60)
            print(" 🎉 HOÀN THÀNH PHIÊN HỌC!")
            print(" Hãy thực hiện bài tập thở tinh chỉnh 7Hz:")
            print("  -> Hít vào từ từ")
            print("  -> Giữ hơi thở 3-5 giây và quan sát cơ thể/suy nghĩ")
            print("  -> Thở ra thư thái")
            print(" Chúc Hau-san (John) ngủ ngon và sớm đạt được ước mơ sang Nhật!")
            print("=" * 60)
            break
        elif choice == 'a':
            play_all(sentences)
        elif choice.isdigit():
            idx = int(choice)
            if 1 <= idx <= len(sentences):
                study_sentence(sentences[idx - 1])
            else:
                input("⚠️ Số câu không hợp lệ! Nhấn [Enter] để thử lại...")
        elif choice.startswith('s '):
            parts = choice.split()
            if len(parts) == 2 and parts[1].isdigit():
                idx = int(parts[1])
                if 1 <= idx <= len(sentences):
                    shadow_sentence(sentences[idx - 1])
                else:
                    input("⚠️ Số câu Shadowing không hợp lệ! Nhấn [Enter] để thử lại...")
            else:
                input("⚠️ Lệnh Shadowing không đúng định dạng! Nhấn [Enter] để thử lại...")
        else:
            input("⚠️ Lệnh không hợp lệ! Nhấn [Enter] để thử lại...")

if __name__ == "__main__":
    main()
