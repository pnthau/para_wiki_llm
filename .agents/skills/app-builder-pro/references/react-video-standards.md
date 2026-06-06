# High-Performance React Video Standards

Guidelines for building "sophisticated" video immersion tools that are frame-accurate and stutter-free.

## 1. Native HTML5 Over Bloated Libraries
- **Mandate**: If a specialized library (like Vidstack) causes dependency hell (e.g., React 19 conflicts), prioritize native `<video>` with React Refs.
- **Why**: Native APIs are 100% compatible and have zero overhead.

## 2. Preventing Playback Stutter
- **State Management**: NEVER use React state for frame-by-frame time updates. Use `useRef` to hold the video element and `requestVideoFrameCallback` for UI syncing.
- **Debouncing Events**: Ensure `onTimeUpdate` doesn't trigger expensive re-renders or multiple timeouts. Use a `lastHandledIdx` ref to gate logic.

## 3. Frame-Accurate Seeking
- **The Seek Pattern**: 
    1. Pause the video.
    2. Set `currentTime`.
    3. Wait for the `seeked` event before resuming.
- **Syncing Subtitles**: Map subtitles to specific mốc thời gian (timestamps) and use binary search for O(log n) lookup performance.

## 4. UI/UX "Sophistication"
- **Glassmorphism**: Use backdrop-blur for subtitle overlays.
- **Micro-interactions**: Scale and color transitions for active sentences.
- **Responsive Layouts**: Use CSS Grid to ensure video and transcript coexist without overlapping.
