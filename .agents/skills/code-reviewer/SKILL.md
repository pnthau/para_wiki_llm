---
name: code-reviewer
version: 1.0
description: Knowledge base cho code review chất lượng cao — checklist theo language + framework + best practices. Bổ sung cho agent `code-reviewer`.
target_user: John
integration: Gemini CLI + agent code-reviewer
last_updated: 2026-05-17
---

# Code Reviewer Skill — Knowledge Base

> Skill này cung cấp **knowledge depth** cho review. Khi cần chạy review flow thực tế: dùng `agents/code-reviewer.md`.

## 1. Universal Checklist

### Correctness
- Logic match requirements?
- Edge cases (null, empty, max value, negative)?
- Off-by-one errors?
- Race conditions trong async/multi-thread?

### Maintainability
- Function <50 dòng? Class <300 dòng?
- Cyclomatic complexity <10 mỗi method?
- Naming self-explaining (no `data1`, `temp`, `flag2`)?
- DRY — code lặp lại có cần extract?
- Comment giải thích "why" không phải "what"?

### Performance
- N+1 query (DB, API loop)?
- O(n²) khi O(n log n) khả thi?
- Memory leak (listener không unregister, cache vô hạn)?
- Block thread chính (sync I/O trong event loop)?

### Security (xem thêm `agents/security-reviewer.md`)
- Input validation?
- Output encoding (XSS)?
- Auth check trên endpoint nhạy cảm?
- Secrets hardcoded?

### Testing
- Test cover happy path + edge case + error path?
- Test name describe behavior, not implementation?
- Mock đúng scope (không mock object đang test)?
- Coverage >80% cho critical path?

## 2. Language-Specific Anti-Patterns

### Java
- `==` thay `.equals()` cho object
- Mutable shared state không synchronized
- `Optional` làm field/param
- Field injection `@Autowired` (prefer constructor)
- Checked exception lan public API
- `Connection`/`Stream` không try-with-resources

### Kotlin
- `!!` (force non-null) trên external data
- `lateinit` cho nullable scenario
- `data class` cho entity với mutable state
- Coroutine không có timeout

### TypeScript/JavaScript
- `any` lan rộng
- `==` thay `===`
- Promise không catch
- `async` function không await trong loop
- `useState` cho derived value (prefer `useMemo`)

### Python
- Mutable default argument
- Bare `except:`
- `is` thay `==` cho value
- `print` debug còn sót
- Type hint thiếu trên public API

### Go
- Ignore `err` return
- Goroutine leak (không có context cancel)
- `range` copy slice item
- `defer` trong loop
- Interface với 1 method nhưng tên không kết thúc `-er`

## 3. Architecture Smells

- **God Object**: 1 class biết quá nhiều
- **Feature Envy**: method dùng nhiều method của class khác hơn của chính nó
- **Shotgun Surgery**: 1 thay đổi yêu cầu sửa nhiều file
- **Primitive Obsession**: dùng String/int khi nên có Value Object
- **Lasagna Architecture**: quá nhiều layer mà mỗi layer chỉ pass-through

## 4. Review Etiquette

- **Khen trước, sửa sau** khi PR lớn của junior.
- Phân biệt **must-fix** vs **nice-to-have** vs **nit**.
- Đề xuất, không ra lệnh ("Consider..." > "You must...").
- Link ra docs/best-practices khi áp dụng pattern.
- Nếu disagreement: viết "Open to discussion" và explain trade-offs.

## 5. Workflow

1. **Gather context** — `git diff`, đọc surrounding code
2. **Apply checklist** — universal → language-specific → architecture
3. **Filter confidence** — chỉ report >80% confidence
4. **Consolidate** — gộp issue tương tự
5. **Format output** — CRITICAL → HIGH → MEDIUM → LOW với file:line
6. **Suggest verify** — `mvn test`, `npm test`, etc.

## 6. Khi cần escalate

- Lỗ hổng security → `security-reviewer`
- Build error → `build-error-resolver`
- Java/Spring deep dive → `java-architect` skill
- Database/SQL → cần `database-reviewer` (chưa có, có thể tạo thêm)
