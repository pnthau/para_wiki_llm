# Vault Operations Log

## [2026-07-04] Dev & Study | Solved Classpath Loading & IntelliJ Tomcat Artifact Resolution
- **Target**: `C:\Users\dc130\Desktop\fengshui_jewelry` & `D:\data\para_wiki_llm\02_Areas\IT_Knowledge\`
- **Action**:
    - Diagnosed Tomcat classloader failure caused by IntelliJ's broken artifact packaging, preventing `application.properties` from copying to `WEB-INF/classes`.
    - Rewrote `ConfigLoader.java` using a **3-Layer Defensive Coding** strategy: Web Context ClassLoader -> Core Java ClassLoader -> Relative File System Path (IDE local fallback).
    - Fixed the root cause inside IntelliJ's XML artifact configuration (`.idea/artifacts/fengshui_jewelry_main_war_exploded.xml`) by adding an explicit `<element id="directory-content">` instructions for resources.
    - Set up **Delegate to Gradle** and configured explicit `sourceSets` in `build.gradle` to enforce correct classpath setups across teams (Enterprise Standard).
    - Created Cornell-structured note [[Java_Web_Classpath_Tomcat_IntelliJ_Config]] in IT Knowledge and registered it under [[MOC_IT_Knowledge]].
- **Status**: Success. All tests passed, configurations validated, and Tomcat deploys resource files successfully.

## [2026-06-30] Study | Mastered time grammar (~ji, ~fun, ~ni), (N1 ka N2, goro vs kurai), and (~kara ~made V) in N5 Japanese
- **Target**: `02_Areas/Japanese_N5/`
- **Action**:
    - Guided John through a targeted Micro-Raid on N5 time expressions: ~ji (hours), ~fun (minutes).
    - Deepened understanding of the time particle `に` (rules for numerical vs. relative time).
    - Introduced and mastered `N1 か N2` (selection) and `ごろ` vs `くらい` (point of time vs duration).
    - Taught `～から～まで Vます` (from... to... structure for time and space).
    - Resolved vocabulary and particle mistakes (e.g., `会議` spelling, `歩いて` without `de` particle, `始まります` being intransitive with `が`, and removing `を` before motion verbs like `帰ります` after `まで`).
- **Status**: Success. Passed all checks with 100% accuracy.

## [2026-06-29] Dev | Audited cuacuonthienanh.vn & Executed SEO/AEO Master Strategy
- **Target**: `01_Projects/seo_cua_cuon_dak_nong_plan.md` & Live Website
- **Action**:
    - Audited live site: Fixed wrong email href (`mailto:cuacuonthienanh@gmail.com`), hidden HCMC pages/districts dropdown menus.
    - Successfully injected JSON-LD Schema (LocalBusiness & FAQPage) in the homepage header.
    - Generated AEO articles: Published "Hướng Dẫn Chọn Bình Lưu Điện Cửa Cuốn Bền Bỉ, Phù Hợp Cho Khí Hậu Tây Nguyên Đắk Nông" at `binh-luu-dien-cua-cuon-loai-nao-tot-cho-khi-hau-dak-nong-bid41.html`.
    - Created Satellite Maps Strategy Plan (`01_Projects/ke_hoach_map_ve_tinh_thien_anh.md`) with 5 target locations, GPS coordinates, and implementation guide.
    - Created Step-by-Step Satellite Map Guide (`01_Projects/huong_dan_tao_map_ve_tinh_chi_tiet.md`) for John.
- **Status**: Success. Essential foundation tasks, first AEO content publish, Satellite Maps plan, and detailed setup guide completed.



## [2026-06-23] Ingest | Absorb Liễu Phàm Tứ Huấn Phần 2 into Personal Growth Vault
- **Target**: `00_Raw/Liễu phàm tứ huấn 2.md` -> `02_Areas/Personal/Lieu_Pham_Tu_Huan_Part_2.md`
- **Action**:
    - Extracted insights on the multifaceted nature of destiny, karma, and the story of Dharma Master Tịnh Không.
    - Structured the raw data using Cornell Notes layout with detailed Cues, detailed Notes, and a personalized Summary on "cải tạo tính cách" (character improvement).
    - Mapped keywords and tags (`[personal-growth, philosophy, destiny, lieu-pham]`) into YAML v4.0 frontmatter.
    - Updated `[[MOC_Personal_Growth]]` to ensure robust linkage within the Persistent Knowledge Wiki.
- **Status**: Success.

## [2026-06-19] Dev | Created Landing Page & Citation Strategy for Cửa Cuốn Đắk Nông
- **Target**: `01_Projects/landing_page_cua_cuon_dak_nong.md` & `01_Projects/danh_sach_citation_va_nap_chuan_seo.md`
- **Action**:
    - Created a highly optimized SEO landing page template `landing_page_cua_cuon_dak_nong.md` containing copywriting, service details, pricing tables, Zalo/Hotline CTAs, and embedded LocalBusiness/FAQPage Microdata Schema markup to rank Top 1.
    - Generated a detailed local citation guide `danh_sach_citation_va_nap_chuan_seo.md` defining a unified NAP profile and pre-optimized brand bio snippets for 20 local directory/social platforms.
    - Processed heavy raw image `suacua101.png` (7.1MB PNG) on Desktop: converted, compressed to 778KB JPEG, and embedded precise GPS metadata for two targets (Nhân Cơ & Gia Nghĩa), outputting to `C:\Users\dc130\Desktop\Cua_Cuon_Da_Geotagged`.
- **Status**: Success. Content assets, local citations, and optimized geo-visual signals are fully prepared.

## [2026-06-18] Ingest | Absorb Liễu Phàm Tứ Huấn Phần 1 into Personal Growth Vault
- **Target**: `00_Raw/Liễu phàm tứ huấn 1.md` -> `02_Areas/Personal/Lieu_Pham_Tu_Huan_Part_1.md`
- **Action**:
    - Extracted detailed lectures from Pháp sư Tịnh Không regarding the background of Viên Liễu Phàm, his encounter with Khổng Tiên sinh, and the absolute predictability of his unchangeable fate as a standard phàm phu.
    - Structured the raw data using Cornell Notes layout with detailed Cues, detailed Notes, and a comprehensive Summary.
    - Mapped keywords and tags (`[personal-growth, philosophy, destiny, lieu-pham]`) into YAML v4.0 frontmatter.
    - Updated [[MOC_Personal_Growth]] to ensure robust linkage within the Persistent Knowledge Wiki.
- **Status**: Success.

## [2026-06-18] Dev | Automated Image Geotagging & Implemented Local Business Microdata SEO for Thien Anh Door
- **Target**: `D:\data\para_wiki_llm`
- **Action**:
    - Created a detailed tactical SEO implementation guide [[chi_tiet_chien_luoc_seo_cua_cuon_dak_nong]] based on the "Vây điểm diệt viện" strategy.
    - Updated [[Schema_Markup_Basics]] with a comprehensive guide on using Microdata attributes (`itemscope`, `itemtype`, `itemprop`) to bypass aggressive CMS script block filters (e.g. TinyMCE's `mce-application/ld+json`).
    - Wrote a custom Python script `geotag_images.py` leveraging `piexif` and `Pillow` to automatically convert, rename (SEO friendly), and write GPS EXIF tags (Nhan Co, Gia Nghia, Dak Mil coordinates) to 37 raw images on the User's Desktop.
    - Successfully processed 37/37 images and output them to `C:\Users\dc130\Desktop\Cua_Cuon_Da_Geotagged` for Google Business Profile upload.
    - Processed 3 new repair images on Desktop (including a giant 8.2MB PNG), writing GPS tags, compressing, and renaming to `sua-cua-cuon-gia-nghia-dak-nong-99.jpg`, `sua-cua-cuon-dak-mil-dak-nong-99.jpg`, and `sua-cua-cuon-nhan-co-dak-nong-98.jpg`.
    - Generated a high-converting SEO-optimized landing page article [[bai_viet_dich_vu_sua_cua_cuon_gia_nghia_seo]] targeting rolling door repair services in Gia Nghia.
    - Wrote a FAQ-Schema integrated informational article [[bai_viet_huong_dan_mo_cua_cuon_khi_mat_dien]] regarding emergency manual door opening during power outages.
- **Status**: Success. Local SEO foundation, Geotagging phase, and initial content creation fully complete. Zalo marketing setup and On-page content publishing are ongoing.

## [2026-06-17] Dev | Resolved Tomcat 404, Rebuilt Artifacts & Standardized Project for Git Sharing
- **Target**: `C:\Users\dc130\Desktop\fengshui_jewelry`
- **Action**:
    - Guided John to identify and fix a logic bug in `ProductRepository.java` (`findByID` method was missing elements populator).
    - Diagnosed a Tomcat 404 error caused by a mismatch between the renamed source packages (`com.fengshui.entity`) and the outdated Maven-based artifact configuration in IntelliJ.
    - Updated `.idea/artifacts/fengshui_jewelry_war_exploded.xml` to compile classes using `fengshui-jewelry.main`, copy modern Jakarta-compatible JSTL dependencies, and explicitly sync `src/main/webapp` resources to bypass IDE web facet configuration bugs.
    - Created `src/main/webapp/WEB-INF/web.xml` using Jakarta EE 6.0 schema to route default context traffic `/` to `/home` cleanly.
    - Created `.gitignore` and `README.md` to prevent local IDE folders (`.idea`, `out`, `build`) from being pushed to GitHub, ensuring smooth team collaboration.
    - Created Cornell-structured notes [[Git_Teamwork_Workflow]] (GitHub Flow & conflict resolution) and [[GitHub_Branch_Protection_Rules]] (setup and review workflow) in IT Knowledge vault and linked them to [[MOC_IT_Knowledge]].
- **Status**: Success. Tomcat deploys cleanly and reads updated JSP files without caching issues.

## [2026-06-17] Dev | Implemented Voice Search JS Module & Optimized Product List Layout
- **Target**: `C:\Users\dc130\Desktop\fengshui_jewelry` (`product_list.jsp`, `style.css`)
- **Action**:
    - Guided John to implement the `VoiceSearchModule` using the IIFE and Closure patterns in JavaScript, keeping state encapsulated.
    - Refactored the JS code to resolve redundant DOM queries and prevent potential browser context `this` bugs.
    - Resolved cache issues by adding cache-busting version query string to `style.css` (`v=1.0.7`).
    - Redesigned the voice button default state to a premium, non-glaring soft gold tint (`rgba(229, 192, 96, 0.15)`) with a larger gold icon for senior-friendly readability.
    - Redesigned the product list grid: shifted from a 2-column to a 3-column layout (`row-cols-md-3 g-3`), reduced product card padding and image aspect ratio (to 80%), and shrunk button vertical padding to compact the page.
- **Status**: Success. Voice Search is fully operational with active recording animation. Ready for the next phase: Quick Order Modal integration.

## [2026-06-16] Dev | Reverted Autocomplete & Initiated Inductive Step-by-Step Guidance
- **Target**: `C:\Users\dc130\Desktop\fengshui_jewelry`
- **Action**: Reverted all direct code completions (controllers, detail page, list updates) to allow John (Hau-san) to learn through hands-on practice. Transitioned to the "Tống Đề Hình Quan" (inductive, step-by-step forensic investigation of code clues) tutoring method.
- **Status**: Success.

## [2026-06-16] Dev | Implemented Product List Page with Bootstrap 5, Year-of-Birth Finder & Voice Search
- **Target**: `C:\Users\dc130\Desktop\fengshui_jewelry` (`ProductListController.java`, `style.css`, `product-list.jsp`, `home.jsp`)
- **Action**: Created `ProductListController` to handle search queries and element filters. Built customized `style.css` (gold-maroon accent, slate dark theme, readability boosts). Designed senior-friendly `product-list.jsp` with year of birth calculator and voice search using Web Speech API. Updated `home.jsp` to follow the custom design system.
- **Status**: Success.

## [2026-06-15] Dev | Secured OpenClaw Gateway Configuration & Enabled Sandbox
- **Target**: `C:\Users\dc130\.openclaw\openclaw.json`
- **Action**: Fixed security audit vulnerabilities in OpenClaw. Configured global sandbox mode (`sandbox.mode = "all"`), disabled insecure auth, and restricted the small `ollama/gemma4:e4b` model from using web and browser tools. Verified with `openclaw security audit` (0 critical errors remaining). Also guided John through an interactive security analysis of Prompt Injection attack vectors and countermeasures (promising to resume this cybersecurity discussion in the next session).
- **Status**: Success.

## [2026-06-15] Dev | Restored Windows system32 cmd.exe & Fixed IntelliJ Tomcat JMX 1099 Error
- **Target**: `C:\Windows\system32\cmd.exe` & `C:\Users\dc130\Desktop\fengshui_jewelry\.idea\workspace.xml`
- **Action**: Diagnosed a system-level bug where `cmd.exe` was replaced with `utilman.exe` (Utility Manager), breaking all `.bat` scripts execution. Created a PowerShell restore script `fix_cmd.ps1` to replace the corrupted file with a genuine 64-bit `cmd.exe` from WinSxS. Reconfigured IntelliJ Tomcat run configuration to deploy the artifact `fengshui-jewelry:war exploded` instead of the project directory.
- **Status**: Success. Tomcat launched and deployed successfully.

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

## [2026-06-15] Dev | Guided John to Implement Element Mapping & Search in Product Repository/Service
- **Target**: `C:\Users\dc130\Desktop\fengshui_jewelry` (Product.java, IProductRepository.java, ProductRepository.java, IProductService.java, ProductService.java, ProductRepositoryTest.java)
- **Action**: Guided John step-by-step through setting up the Many-to-Many mapping for `product_elements`, adding `Set<String> elements` in the Product model, implementing the `findByElement` and `searchByName` methods using JDBC, creating a helper method `getAllElementByProduct` for N+1 loading, and appending corresponding JUnit 5 test cases.
- **Status**: Success.

## [2026-06-15] Dev | Guided John to Create HomeController and home.jsp
- **Target**: `C:\Users\dc130\Desktop\fengshui_jewelry` (HomeController.java, home.jsp)
- **Action**: Guided John step-by-step through setting up his first HttpServlet controller `HomeController` with @WebServlet annotation mapping to `/home`, creating the JSP view directory `WEB-INF/views/user`, and implementing `home.jsp` with UTF-8 character encoding and custom css styling.
- **Status**: Success.
## [2026-06-17] Dev | Implemented Quick Order Modal & Integrated Complete Backend & Frontend Unit Tests
- **Target**: `C:\Users\dc130\Desktop\fengshui_jewelry` (`product_list.jsp`, `QuickOrderController.java`, `fengshui-utils.js`, `test-frontend.html`, `ProductServiceTest.java`, `UserServiceTest.java`)
- **Action**:
    - Built a Bootstrap 5 responsive Modal in `product_list.jsp` for senior-friendly checkout (large inputs, custom quantity stepper, client-side validation, AJAX submit).
    - Created `QuickOrderController.java` to handle order submission with transaction commit/rollback safety, inventory verification, and JSON response.
    - Decoupled JS functions into a pure utility module `fengshui-utils.js` to allow testing.
    - Designed a premium visual test runner page `test-frontend.html` to execute and report frontend assertions instantly in the browser.
    - Added JUnit 5 unit test cases: `ProductServiceTest` and `UserServiceTest` to achieve complete backend service-layer test coverage.
- **Status**: Success. All tests integrated and fully operational.

## [2026-06-17] Dev | Migrated Project Build from Maven to Gradle & Upgraded to Tomcat 10 (Jakarta EE 10)
- **Target**: `C:\Users\dc130\Desktop\fengshui_jewelry`
- **Action**:
    - Created `build.gradle` and `settings.gradle` configurations using Java 17, war packaging, and Jakarta EE 10 dependencies.
    - Renamed `pom.xml` to `pom.xml.bak` as backup.
    - Migrated all servlet imports in Java controllers (`HomeController`, `ProductListController`, `QuickOrderController`) from `javax.servlet` to `jakarta.servlet` namespace.
    - Updated JSP standard tag library (JSTL) URI declarations in `product_list.jsp` to use Tomcat 10 compatible `jakarta.tags.*` format.
- **Status**: Success. Ready for IntelliJ to reload Gradle and run on Tomcat 10.

## [2026-06-18] Dev | Guided IntelliJ IDEA License Activation
- **Target**: Local Environment Setup
- **Action**: Guided John on how to redeem and activate the 6-month corporate IntelliJ license using the provided 29-character activation code.
- **Status**: Completed instruction delivery.

## [2026-06-20] Study | N5 Japanese Morning Routine Micro-Raids
- **Target**: Personal Memory & Semantic Consolidation
- **Action**: Conducted Fog-Pilot protocol to overcome sleepiness. Guided John through a series of N5 Japanese vocabulary micro-raids (Nemui, Okimasu, Tabemasu, Nomimasu, Ikimasu) related to morning routines. Successfully achieved Flow state and ended with 7Hz Post-Session Breathing.
- **Status**: Success. John successfully typed full Japanese sentences.

## [2026-06-23] Ingest | Absorb 'Tâm lý học Yale 13' into Personal Vault
- **Target**: `00_Raw/Tâm lý học Yale 13.md` -> `02_Areas/Personal/Yale_Psychology_13_Individual_Differences.md`
- **Action**:
    - Extracted the core dialectical paradox between Genetics and Environment regarding Personality and Intelligence from Professor Paul Bloom's Yale lecture.
    - Structured the raw data using Cornell Notes layout with detailed Cues, detailed Notes, and a comprehensive Summary.
    - Mapped keywords and tags (`[psychology, personality, intelligence, genetics, personal-growth]`) into YAML v4.0 frontmatter.
    - Updated `[[MOC_Personal_Growth]]` to ensure robust linkage within the Persistent Knowledge Wiki.
- **Status**: Success.
