import whisper
import sys
import os

def transcribe(file_path):
    if not os.path.exists(file_path):
        print(f"Error: File {file_path} not found.")
        return

    # Use the 'base' model for a good balance between speed and accuracy
    # Alternatives: 'tiny', 'small', 'medium', 'large'
    model = whisper.load_model("base")
    
    print(f"Transcribing {file_path}...", file=sys.stderr)
    result = model.transcribe(file_path)
    
    print(result["text"])

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python transcribe_media.py <path_to_media_file>")
    else:
        transcribe(sys.argv[1])
