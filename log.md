# Vault Operations Log

## [2026-06-11] Dev | Expanded FengShui DB Schema with Inventory Mgmt & Triggers
- **Target**: `01_Projects/Create_FengShui_DB_Schema.sql`, `01_Projects/FengShui_Jewelry_Web_DB_Design.md` & `01_Projects/Servlet_JSP_Project_Structure.md`
- **Action**: Added table `inventory_transactions` to track stock imports and exports. Added two MySQL triggers: `trg_after_insert_order_items` to auto-export on sale, and `trg_after_insert_inventory_transaction` to update product stock level. Updated ERD and MVC code blueprint to match this database structure.
- **Status**: Success.

## [2026-06-11] Dev | Created 'Web_AppSec_Spam_Defense.md' & Updated MOC_IT_Knowledge.md
- **Target**: `02_Areas/IT_Knowledge/Web_AppSec_Spam_Defense.md` & `MOCs/MOC_IT_Knowledge.md`
- **Action**: Created a comprehensive guide on Web Application Security and Spam Defense focusing on no-login checkouts for the elderly (analyzing Honeypots, Time-locks, Automation detection, Cloudflare Turnstile, and Java Filter Rate Limiting). Bidirectionally linked to the MOC.
- **Status**: Success.

## [2026-06-09] Ingest | 'Khái niệm Grid view...' -> 'CSS_Responsive_Design.md' (Cornell + Expanded)
- **Raw Source**: User Request
- **Output**: `02_Areas/IT_Knowledge/CSS_Responsive_Design.md` & `MOCs/MOC_IT_Knowledge.md`
- **Expansion**: Documented CSS Grid View, Responsive Web Design principles, and Media Queries. Provided Mobile-First implementation workflow. Added OOP/GUI analogies for Java Swing Layout Managers (GridLayout, BorderLayout, resizing listeners) to facilitate transfer of knowledge.
- **Status**: Success.

## [2026-06-07] Dev | Created 'Chicken_Tracking_Log.md', SEO Plan, Schema & Multiple Content Artifacts
- **Target**: `01_Projects/Chicken_Tracking_Log.md`, `01_Projects/seo_cua_cuon_dak_nong_plan.md`, `02_Areas/IT_Knowledge/Schema_Markup_Basics.md`, `01_Projects/danh_sach_tu_khoa_content_dak_nong.md`, `01_Projects/bai_viet_cong_nghe_cua_cuon_moi_nhat.md`
- **Action**:
    - Created tracking project log for John's Mía Sơn Tây hens.
    - Created a comprehensive local SEO & GEO/AEO strategy blueprint for rolling doors business in Dak Nong.
    - Wrote a structural explanation of Schema Markup tailored for a Java developer.
    - Generated a target keyword list and local content structure blueprint for Dak Nong.
    - Authored a high-converting SEO article focusing on the latest smart rolling door technologies and accessories.
- **Status**: Success.

## [2026-06-06] Ingest | 'Sử dụng màu sắc trong trang web' → 'CSS_Colors.md' (Cornell + Expanded)
- **Raw Source**: `00_Raw/Sử dụng màu sắc trong trang web.md`
- **Output**: `02_Areas/IT_Knowledge/CSS_Colors.md`
- **Expansion**: Documented Hex/RGB color spaces. Added RGBA alpha channels, HSL/HSLA color models, programmatic lightness adjustment (hover color scaling), and central theme management with CSS Variables (`:root`). Added Java analogies (Color constants, Color decode, Color HSB conversion, static constant colors).
- **Status**: Success.

## [2026-06-06] Ingest | 'Điều chỉnh màu nền và ảnh nền' → 'CSS_Backgrounds.md' (Cornell + Expanded)
- **Raw Source**: `00_Raw/Điều chỉnh màu nền và ảnh nền.md`
- **Output**: `02_Areas/IT_Knowledge/CSS_Backgrounds.md`
- **Expansion**: Documented background color/image/repeat/position/attachment options and shorthand syntax. Added background-size (cover/contain), opacity vs RGBA rendering behaviors, and linear-gradients. Added Java2D analogies (TexturePaint, Viewport space, color alpha vs graphics AlphaComposite).
- **Status**: Success.

## [2026-06-06] Ingest | 'Đường viền trong CSS' → 'CSS_Borders.md' (Cornell + Expanded)
- **Raw Source**: `00_Raw/Đường viền trong CSS.md`
- **Output**: `02_Areas/IT_Knowledge/CSS_Borders.md`
- **Expansion**: Documented style options, color/width settings, and TRBL clock-wise rules. Added modern border-radius bo góc configurations, outline vs border layout behaviors, and shadow decorations. Added Swing border, Oval clipping, and Decorator OOP analogies.
- **Status**: Success.

## [2026-06-06] Ingest | 'Phông chữ với CSS' → 'CSS_Fonts.md' (Cornell + Expanded)
- **Raw Source**: `00_Raw/Phông chữ với CSS.md`
- **Output**: `02_Areas/IT_Knowledge/CSS_Fonts.md`
- **Expansion**: Standardized font styling, styling variables (normal/bold/100-900), size units (`px` vs `em` vs `rem` root sizing), Google Fonts loading methods, and shorthand `font` syntax. Added OOP analogies for fallback, scopes, and Maven dependencies.
- **Status**: Success.

## [2026-06-06] Ingest | 'Bảng trong CSS' → 'CSS_Tables.md' (Cornell + Expanded)
- **Raw Source**: `00_Raw/Bảng trong CSS.md`
- **Output**: `02_Areas/IT_Knowledge/CSS_Tables.md`
- **Expansion**: Added `border-collapse`, spacing (padding), alignment rules, and advanced layout techniques (Zebra striping, Hover rows, Responsive `overflow-x: auto` wrapping, and `table-layout: fixed` rendering). Added Java GUI and loop analogies.
- **Status**: Success.

## [2026-06-06] Lint | Split 'CSS_Lists.md' → Created 'CSS_Modern_Nav_Menu.md'
- **Target**: `02_Areas/IT_Knowledge/CSS_Modern_Nav_Menu.md` & `02_Areas/IT_Knowledge/CSS_Lists.md`
- **Action**: Extracted the detailed Flexbox Navigation Menu analysis out of `CSS_Lists.md` into a dedicated atomic note to improve readability. Left a concise link in `CSS_Lists.md` and updated `MOC_IT_Knowledge.md`.
- **Status**: Success.

## [2026-06-06] Update | Consolidated Flexbox vs Lists Analysis into 'CSS_Lists.md'
- **Target**: `02_Areas/IT_Knowledge/CSS_Lists.md`
- **Details**: Updated practical nav menu example to use modern Flexbox pattern. Added analysis of Flexbox limitations on lists (marker box loss, WebKit/Safari list role bug) and workarounds (Composition, explicit A11y roles). Added OOP analogy (Composition vs Inheritance).
- **Status**: Success.

## [2026-06-06] Ingest | 'Danh sách trong CSS' → 'CSS_Lists.md' (Cornell + Expanded)
- **Raw Source**: `00_Raw/Danh sách trong CSS.md`
- **Output**: `02_Areas/IT_Knowledge/CSS_Lists.md`
- **Expansion**: Bảng giá trị `list-style-type` (disc/circle/square/decimal/alpha/roman), cảnh báo `list-style-image` fallback, so sánh `inside/outside`, color inheritance logic, Nav Menu pattern thực tế, Java OOP analogy.
- **Status**: Success.

## [2026-06-06] Ingest | 'Selector khác nhau trong CSS' → 'CSS_Selectors.md' (Cornell + Expanded)
- **Raw Source**: `00_Raw/Selector khác nhau trong CSS.md`
- **Output**: `02_Areas/IT_Knowledge/CSS_Selectors.md`
- **Expansion**: Universal `*`, Descendant/Child selector, Pseudo-class `:hover/:focus`, Cheat-sheet hint table, Java Developer analogies (id≈biến, class≈interface, descendant≈composition).
- **Status**: Success.

## [2026-06-06] Ingest | Transformed 'Cú pháp của CSS' raw file into '02_Areas/IT_Knowledge/CSS_Syntax.md' with Cornell format + expanded content (3 Selectors, 3 Embed methods, Specificity, Java hint). Updated 'MOC_IT_Knowledge.md' and bidirectional links.
- **Raw Source**: `00_Raw/Cú pháp của CSS.md`
- **Output**: `02_Areas/IT_Knowledge/CSS_Syntax.md`
- **Expansion**: Thêm 3 loại Selector, 3 cách nhúng CSS, thứ tự ưu tiên Specificity và Hint cho Java Developer.
- **Status**: Success.

## [2026-06-06] Ingest | Transformed 'CSS là gì' raw file into '02_Areas/IT_Knowledge/CSS_Basics.md' with Cornell format. Updated 'MOC_IT_Knowledge.md'.
- **Raw Source**: `00_Raw/CSS là gì.md`
- **Output**: `02_Areas/IT_Knowledge/CSS_Basics.md`
- **Status**: Success.

## [2026-06-06] Ingest & Dev | Created 'gem_n5_genki' Custom Gem Prompt and Interactive HTML App
- **Raw Source**: `00_Raw/Genki_Japanese_Greeting.md`
- **Outputs**: `03_Resources/Japanese_N5/gem_n5_genki.md` & `03_Resources/Study_Readers/gem_n5_genki.html`
- **Details**: Ingested 22 Genki greetings. Created the Gemini Custom Gem system prompt instructions and a premium dark-slate glassmorphic web-app for learning, TTS audio, matching game, and quiz tests.
- **Status**: Success.

## [2026-06-04] Ingest | Transformed 'VÔ TRUNG SINH HỮU' raw file into '02_Areas/Strategy/Vo_Trung_Sinh_Huu_Analysis.md' with Cornell format. Updated 'MOC_Strategy.md'.

## [2026-05-29] Nexus Singularity Evolution v8.0 (Manual Override)
- **Task Scheduler**: Registered `NexusNoonEvolution` task at 12:00 ICT daily.
- **Self-Expansion**: 
    - Researched latest Java 21 & Spring Boot 4.0 trends.
    - Researched JLPT N5 IT Vocabulary.
- **Ingest**: 
    - Created `02_Areas/IT_Knowledge/Java_21_Enterprise_Evolution_2026.md`.
    - Created `02_Areas/Japanese_N5/IT_Japanese_N5_Essential_Katakana.md`.
- **Status**: Success. System is now fully autonomous for daily growth.

2026-05-30 12:24:02
Challenge 11 completed: SQL Query for Furama DB with Subquery exclusion logic.
2026-05-30 13:06:09
Challenge 12 completed: Successfully retrieved top used services using GROUP BY, HAVING, and Subquery MAX.
2026-05-30 13:36:41
Challenge 13 completed: Retrieved services used exactly once using EXISTS and Aggregate logic.

## [2026-05-30] Ingest | MCP & ADK Architecture
- **Raw Source**: `00_Raw/MCP and ADK.md`
- **Output**: `02_Areas/IT_Knowledge/MCP_ADK_Frameworks.md`
- **Insight**: Identified MCP for standardized tool connection and ADK for structured multi-agent orchestration as key self-upgrade vectors.
- **Status**: Success.

2026-05-31 18:41:14
Micro-victory: SQL SUM vs COUNT corrected by John (Grasp Before Passing). Sentiment: Low Energy/Focus but High Discipline. Status: Resting for recovery.

2026-05-31 18:48:04
Mission Accomplished: SQL Deep Raid finished. John showed extreme persistence despite low energy. Ready for recovery and next Java/N5 phase.

2026-05-31 18:52:04
Level 1 Mastery: John correctly identified SQL Execution Order error in WHERE clause. Session forced to close for recovery. Status: Bushido Spirit detected.

2026-05-31 19:04:28
GRADUATION: John (Hau-san) officially mastered SQL Execution Order (10/10 Drills). Status upgraded to SQL MASTER. Energy: Low, Discipline: God-tier. Closing session for recovery.

## [2026-06-03] Ingest | Strategy: Founder to 80 Engineers
- **Raw Source**: `00_Raw/phát triển thần tốc từ 1 người sáng lập lên đội ngũ 80.md`
- **Output**: `02_Areas/Strategy/Scaling_Founder_to_80_Engineers.md`
- **Insight**: Tận dụng AI để mã hóa "Taste" và tự động hóa Onboarding/Code Review là chìa khóa để scaling không giới hạn. Đề xuất tích hợp "Sentiment Guard" và "Code Shadowing" vào hệ thống Nexus.
- **Status**: Success.

## [2026-06-01] Lint | M2 Smart Linking (Orphans)
- **Target**: 3 orphan notes (`AI_CORAL_Architecture`, `AI_Japanese_Tutor_Modern_Methods`, `Cách sử dụng chỉ mục...`).
- **Action**: Added bidirectional links and registered in MOCs.
- **Status**: Success. Improved vault connectivity for IT and Japanese domains.

## [2026-06-15] Ingest & Dev | JSP vs Servlet Comparison Note
- **Target**: `02_Areas/IT_Knowledge/JSP_vs_Servlet.md` & `MOCs/MOC_IT_Knowledge.md`
- **Action**: Created Cornell-style atomic comparison note distinguishing between JSP and Servlet roles (Controller vs View) within the MVC architecture. Registered in the IT Knowledge MOC.
- **Status**: Success.

## [2026-06-15] Dev | Implemented Feng Shui Element Mapping and Product Search
- **Target**: `C:\Users\dc130\Desktop\fengshui_jewelry` (Product.java, IProductRepository.java, ProductRepository.java, IProductService.java, ProductService.java)
- **Action**: Corrected database mapping gaps. Added Set<String> elements to Product model. Implemented save/update transaction mappings for `product_elements`. Added element-based filtering `findByElement` and keyword search `searchByName` in repository and service layers.
- **Status**: Success.


