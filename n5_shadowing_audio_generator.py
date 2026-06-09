import asyncio
import os
import sys
import subprocess
import math
import struct
import wave

# Ensure dependencies are installed
def install_dependencies():
    try:
        import edge_tts
        import pydub
    except ImportError:
        print("Đang cài đặt các thư viện cần thiết (edge-tts, pydub)...")
        subprocess.check_call([sys.executable, "-m", "pip", "install", "edge-tts", "pydub"])
        print("Đã cài đặt xong thư viện!")

install_dependencies()

import edge_tts
from pydub import AudioSegment

# Configuration
VOICE = "ja-JP-NanamiNeural"  # Giọng nữ tiếng Nhật chất lượng cao
OUTPUT_FILENAME = "shadowing_practice.wav"
SPEED_RATE = "-10%"           # Giảm tốc độ đọc 10% cho người mới học N5
PAUSE_MULTIPLIER = 1.5        # Thời gian dừng = 1.5 lần thời gian nói

# Hàm tạo file còi BÍP (WAV) không dùng thư viện ngoài
def generate_beep_wav(filepath, frequency=880, duration_ms=200, sample_rate=24000):
    num_samples = int(sample_rate * (duration_ms / 1000.0))
    # Tạo dữ liệu sóng sine
    audio_data = bytearray()
    for i in range(num_samples):
        t = float(i) / sample_rate
        sample = int(32767.0 * math.sin(2.0 * math.pi * frequency * t))
        audio_data.extend(struct.pack('<h', sample))
        
    with wave.open(filepath, 'wb') as wav_file:
        wav_file.setnchannels(1) # Mono
        wav_file.setsampwidth(2) # 16-bit
        wav_file.setframerate(sample_rate)
        wav_file.writeframes(audio_data)

# Hàm tạo khoảng lặng (WAV)
def generate_silence_wav(filepath, duration_ms, sample_rate=24000):
    num_samples = int(sample_rate * (duration_ms / 1000.0))
    audio_data = bytearray(num_samples * 2) # 16-bit = 2 bytes per sample
    with wave.open(filepath, 'wb') as wav_file:
        wav_file.setnchannels(1)
        wav_file.setsampwidth(2)
        wav_file.setframerate(sample_rate)
        wav_file.writeframes(audio_data)

async def generate_shadowing_audio(text_block):
    # Tách câu dựa trên dấu chấm tiếng Nhật hoặc xuống dòng
    raw_sentences = text_block.replace("\n", "。").split("。")
    sentences = [s.strip() for s in raw_sentences if s.strip()]
    
    if not sentences:
        print("Không tìm thấy câu nào để xử lý!")
        return

    print(f"Tìm thấy {len(sentences)} câu. Bắt đầu tải âm thanh TTS...")

    temp_files = []
    combined_audio = AudioSegment.empty()

    # Tạo file beep tạm thời
    beep_path = "temp_beep.wav"
    generate_beep_wav(beep_path, frequency=880, duration_ms=150)
    beep_audio = AudioSegment.from_wav(beep_path)
    temp_files.append(beep_path)

    for i, sentence in enumerate(sentences):
        print(f"Đang xử lý câu {i+1}/{len(sentences)}: {sentence}")
        sentence_mp3 = f"temp_sentence_{i}.mp3"
        sentence_wav = f"temp_sentence_{i}.wav"
        
        # 1. Tải TTS từ Microsoft Edge TTS
        communicate = edge_tts.Communicate(sentence + "。", VOICE, rate=SPEED_RATE)
        await communicate.save(sentence_mp3)
        temp_files.append(sentence_mp3)

        # 2. Chuyển MP3 sang WAV để ghép nối ổn định
        try:
            audio_segment = AudioSegment.from_mp3(sentence_mp3)
        except Exception:
            # Nhắc nhở người dùng cài đặt ffmpeg nếu pydub bị lỗi
            print("\n⚠️  LƯU Ý: Thư viện pydub cần 'ffmpeg' để chuyển đổi MP3.")
            print("Vui lòng tải hoặc kiểm tra xem ffmpeg đã có trên hệ thống chưa.")
            print("Nếu chưa có, bạn có thể thực hành trực tiếp trên file HTML vô cùng tiện lợi.\n")
            raise

        audio_segment.export(sentence_wav, format="wav")
        temp_files.append(sentence_wav)

        # 3. Tính toán thời gian khoảng dừng
        tts_duration_ms = len(audio_segment)
        pause_duration_ms = int(tts_duration_ms * PAUSE_MULTIPLIER)
        if pause_duration_ms < 2000:
            pause_duration_ms = 2000 # tối thiểu 2 giây

        # 4. Tạo file khoảng lặng tạm thời
        silence_path = f"temp_silence_{i}.wav"
        generate_silence_wav(silence_path, pause_duration_ms)
        silence_audio = AudioSegment.from_wav(silence_path)
        temp_files.append(silence_path)

        # 5. Ghép nối: [Câu đọc] -> [Còi Bíp] -> [Khoảng lặng]
        combined_audio += audio_segment + beep_audio + silence_audio

    # Xuất file kết quả
    print(f"Đang tạo file tổng hợp: {OUTPUT_FILENAME}...")
    combined_audio.export(OUTPUT_FILENAME, format="wav")
    print(f"🎉 ĐÃ HOÀN THÀNH! File âm thanh lưu tại: {os.path.abspath(OUTPUT_FILENAME)}")

    # Dọn dẹp file tạm
    print("Đang dọn dẹp các tệp tạm thời...")
    for f in temp_files:
        if os.path.exists(f):
            os.remove(f)

if __name__ == "__main__":
    # Nhập văn bản mẫu nếu chạy trực tiếp
    sample_text = """
    明日、８時に来てください。
    寒いですから、上着を着てください。
    日本語のCDを聞いてください。
    3ページを開けてください。
    """
    
    print("--- CHƯƠNG TRÌNH TẠO AUDIO LUYỆN SHADOWING ---")
    print("Vui lòng nhập văn bản tiếng Nhật cần tạo audio (Nhấn Enter rồi Ctrl+Z và Enter trên Windows để hoàn tất):")
    
    try:
        user_input = sys.stdin.read().strip()
    except KeyboardInterrupt:
        user_input = ""
        
    if not user_input:
        print("Không có đầu vào, sử dụng văn bản mẫu...")
        user_input = sample_text

    asyncio.run(generate_shadowing_audio(user_input))
