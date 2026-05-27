# CAMMUP Website — Figma Make Prompt (Final)

> **Tool:** Figma Make ([figma.com/make](https://figma.com/make))
> **Project:** CAMMUP company landing page
> **Target:** Desktop 1440×900 + responsive mobile, 7 snap-scroll sections
> **Hero asset:** Image 4 (iridescent water-bubble image you generated)
> **Tone:** Professional, investor-grade, restrained warmth
> **Languages:** English primary, Korean secondary

---

## 📋 How to Use This File

### Step 1: Open Figma Make
- Go to [figma.com/make](https://figma.com/make)
- Or: Figma home → "Make" button (top right)
- Sign in with your Figma account (cammupco@gmail.com)

### Step 2: Create New Project
- Click "New Make project"
- You'll see a chat-like interface with a prompt input

### Step 3: Upload Image 4 First
- **Before pasting the prompt**, attach Image 4 (your iridescent water-bubble image)
- Use the paperclip icon or drag-and-drop
- This image becomes the Hero background

### Step 4: Paste the Full Prompt
- Copy the **entire code block below** (the main prompt)
- Paste into the input
- Click Generate / Send

### Step 5: Wait 1-2 Minutes
- Figma Make generates the design + working code
- You'll see a live preview on the right side

### Step 6: Iterate
- If anything looks off, use the **"Quick Fix Prompts"** at the bottom of this file
- Or chat with Figma Make naturally: "Make the Hero text larger"

### Step 7: Copy to Figma Design (when satisfied)
- Click "Copy as design layers" or "Open in Figma"
- The design appears in your Figma file ready to refine

---

## 🎯 The Figma Make Prompt (copy everything below)

```
Build an interactive, scroll-snap landing page for CAMMUP, a Korean 
R&D company researching "question technology" for human communication.

═══════════════════════════════════════
REQUIREMENTS
═══════════════════════════════════════
- Desktop primary: 1440×900 (also generate responsive mobile version)
- Snap-scroll behavior: each section snaps into view as user scrolls
- 7 full-screen sections, each exactly 100vh
- Working CSS animations:
  * Hero background "breathing" effect (subtle 3-5px vertical drift, 
    8-10s loop, opacity pulse 90-100% over 4s)
  * Subtle hover states on all cards and buttons
  * Smooth section transitions
- Working snap indicator dots on right edge (clickable, navigates to 
  section)
- Sticky transparent top nav that changes color based on background 
  (light text over dark sections, dark text over light sections)
- Smooth scroll behavior, accessible focus states
- All text content in both English (primary) and Korean (secondary)
- Use the uploaded reference image as Hero background (full-screen)

Bias toward editorial, magazine-style layouts. Investor-grade 
professional tone, not consumer cute.

═══════════════════════════════════════
COMPANY POSITIONING
═══════════════════════════════════════
- Name: CAMMUP (legal: CAMMUPLABS)
- Headline tagline: "We build the technology of questions."
- Korean sub: "질문이 기술이 되는 곳"
- Audience: investors, B2B partners (schools, educational institutions)
- Tone: confident, professional, restrained. This is a serious R&D 
  company that happens to care about humanity — not a cute consumer 
  startup. Editorial, data-forward, mature.

═══════════════════════════════════════
VISUAL SYSTEM
═══════════════════════════════════════
- Base: warm off-white (#FDF7F1) + deep warm black (#211C19)
- Accent 1: brand pink #FF0051 — used sparingly for emphasis only
- Accent 2: ink navy #1E2A44 — professional weight, used for data 
  visualizations and section transitions
- Pastels (peach, sage, sky) used only as subtle small accents or 
  data viz colors — NOT as primary backgrounds
- Typography: Anta for headlines (geometric, technical), Inter for 
  body, Alexandria for Korean
- Generous whitespace (80-120px section padding)
- Editorial magazine-style layouts (left-aligned, not centered)
- NO illustrations of people in any section
- NO stock photos — use abstract geometric shapes, typography, 
  data visualizations as primary visual elements
- Each section has small number marker (01, 02, ...) and section 
  label in pink with letterspacing
- Right edge of every section: 7 vertical snap-indicator dots, 
  current section highlighted

═══════════════════════════════════════
SECTION 01 — HERO (with uploaded image as background)
═══════════════════════════════════════
FULL-SCREEN background using the UPLOADED REFERENCE IMAGE (iridescent 
water-formed speech bubbles floating above a calm water surface, 
chat-bubble shapes with rainbow refractions on warm gradient).

Apply a subtle dark gradient overlay: 25% opacity at the bottom half, 
0% at the top. This keeps the bubbles visible while ensuring text 
readability.

Apply CSS animations to the hero background:
- Subtle vertical drift: 3-5px up and down, 8-10 second loop
- Opacity pulse: 90% to 100% over 4 second loop
- These create a "breathing" effect making the static image feel alive

ON TOP of the image (transparent nav at top, text block in lower half):

- TOP NAV (transparent background, sticky):
  - CAMMUP wordmark (left)
  - Center links: Thesis · Roadmap · Products · Contact
  - Right: EN/KR toggle + "Get in touch" button
  - All text in dark warm black (#211C19) — the top of the image 
    is light enough to support dark text

- CENTERED TEXT BLOCK (positioned in lower 40% of screen):
  - Small pill at top: "● QUESTION TECHNOLOGY · 질문 기술"
    (semi-transparent white background, backdrop blur, pink dot)
  - Massive headline in WHITE Anta with subtle dark text-shadow:
    "We build the technology
     of questions."
  - Korean sub in semi-transparent white Alexandria (smaller):
    "질문이 기술이 되는 곳."
  - Two CTAs in a row:
    * Primary: solid dark pill "Read our thesis →" 
      (dark background, white text)
    * Secondary: outlined white "Talk to us"

- BOTTOM-LEFT corner: small "Scroll ↓" hint in dark warm color

═══════════════════════════════════════
SECTION 02 — THE PROBLEM (data-forward)
═══════════════════════════════════════
Off-white background (#FDF7F1).
Section number "01 / THE PROBLEM" in pink, tiny letterspaced uppercase.

LEFT SIDE (40% width):
  Headline (Anta, large, left-aligned):
  "Conversations are breaking down
   across generations."
  Korean sub (smaller, muted): "세대 간 대화가 끊어지고 있습니다."
  
  Paragraph below (Inter, 16px):
  "Korea's generational divide is no longer just cultural — 
   it's measurable, and it's widening."
  Korean: "한국의 세대 단절은 더 이상 문화적 차이가 아닌, 
          측정 가능한 사회적 비용입니다."

RIGHT SIDE (60% width): Three large stat cards stacked vertically.
Each card: white background, thin border (#EDE5DB), 24px padding.

  STAT 1:
    Large number in Anta (96pt): "63.2%"
    Label (Inter, semibold): "say generational communication 
                              has broken down"
    Korean (smaller, muted): "한국인 중 '세대 간 소통이 잘 안 된다'고 응답"
    Source line (tiny, gray, italic): "한국행정연구원, 2022"
    
  STAT 2:
    Large number: "88%"
    Label: "see generational conflict as serious"
    Korean: "세대 갈등이 심각하다고 인식"
    Source: "한국갤럽, 2026"
    
  STAT 3 (with subtle pink up-arrow icon):
    Large number: "+16%p"
    Label: "increase in perceived disconnection in 9 years"
    Korean: "9년간 소통 단절 인식 증가 (2013→2022)"
    Source: "한국행정연구원"

═══════════════════════════════════════
SECTION 03 — OUR THESIS
═══════════════════════════════════════
Dark warm background (#211C19), white text. Pink accents only.
Section number "02 / OUR THESIS" in pink, centered at top.

CENTER LARGE HEADLINE:
"Better conversations
 start with the right question."
Korean (smaller, muted): "더 좋은 소통은 더 좋은 질문에서 시작됩니다."

Below the headline, THREE PILLARS in a horizontal row:
Each pillar has a tiny geometric icon (circle, triangle, square), 
the English line, and Korean line below.

  ① Questions, not messages.
     메시지가 아니라 질문입니다.
     
  ② Designed, not random.
     우연이 아니라 설계입니다.
     
  ③ Tech, not just talk.
     대화가 아니라 기술입니다.

BOTTOM closing statement (smaller white text, centered):
"CAMMUP researches and builds the question-engineering layer 
 of human-AI interaction. We don't build chat apps. We build 
 the questions inside them."
Korean: "CAMMUP은 인간과 AI 상호작용의 '질문 설계' 영역을 
        연구하고 개발합니다."

═══════════════════════════════════════
SECTION 04 — ROADMAP (key section — make it striking)
═══════════════════════════════════════
Off-white background. Section number "03 / ROADMAP" at top in pink.

TOP-LEFT HEADLINE (Anta, large):
"Where we're going."
Korean: "우리는 어디로 갑니다."

Below heading: "A three-stage research and product roadmap. Each 
stage compounds the data and questions for the next."
Korean: "3단계 연구·제품 로드맵. 각 단계가 다음 단계의 
       데이터와 질문 자산이 됩니다."

MAIN VISUAL: A HORIZONTAL TIMELINE filling 60% of screen height.

Layout structure:
- Thin horizontal line across the middle
- Three dots/stops on the line, evenly spaced
- Year labels above the line: 2026 | 2027 | 2028
- Large detailed cards BELOW each dot

  STAGE 1.0 — 2026 (active, pink accent)
    Status badge: "● LIVE"
    Title (Anta, 28pt): TalkBingo
    Type tag: "B2C — Consumer"
    Description: "A game-based chat platform for real 
                  conversation. Where empathy completes the line."
    Korean: "공감이 빙고를 완성합니다."
    Mini CTA: "Visit page →"
    
  STAGE 2.0 — 2027 (next, ink navy accent)
    Status badge: "● IN DEVELOPMENT"
    Title: Debate Platform for Class
    Type tag: "B2B — Education"
    Description: "AI-driven debate, designed for the 
                  classroom. Where students learn to speak up."
    Korean: "발언하는 법을 가르치는 토론 플랫폼."
    Mini CTA: "Preview →"
    
  STAGE 3.0 — 2028 (future, muted sage accent)
    Status badge: "○ R&D"
    Title: Generational AI Mediator
    Type tag: "B2B / Research"
    Description: "An AI that translates between generations. 
                  The interpreter for the modern family 
                  and workplace."
    Korean: "세대 간 통역사가 되는 AI."

Above the timeline (small pink note, Inter 12px):
"Each product feeds the next with data and refined questions."

═══════════════════════════════════════
SECTION 05 — PRODUCTS
═══════════════════════════════════════
Off-white background. Section number "04 / PRODUCTS" at top.

TOP-LEFT HEADLINE: "What we've built so far."
Korean: "지금까지 만든 것."

TWO LARGE HORIZONTAL PRODUCT CARDS stacked vertically.
Each card layout:
- Left 35%: colored accent panel with large product wordmark (Anta)
- Right 65%: white content panel with details and CTA

CARD 1 — TalkBingo
  Left panel: pink accent (#FFC7D6)
    - Large "TalkBingo" wordmark in dark text
    - Status pill: "● Live · B2C"
  Right panel:
    - Tagline (Anta, 28pt): "Game-based communication. 
                            Empathy is the rule that completes 
                            the line."
    - Korean (smaller): "공감으로 완성되는 게임 기반 대화."
    - Three feature tags in a row:
      "AI-generated questions" · "Empathy-driven gameplay" · 
      "Available iOS · Android"
    - CTA button: solid dark "Visit page →"

CARD 2 — Debate Platform for Class
  Left panel: ink navy (#1E2A44)
    - "Debate Platform" wordmark in white
    - Status pill: "○ In development · B2B"
  Right panel:
    - Tagline: "Where students learn by speaking, 
                not by being told."
    - Korean: "강요가 아닌, 발언으로 배우는 교실."
    - Three feature tags:
      "AI debate prompts" · "Turn-based flow" · "SEL-integrated"
    - CTA button: outlined "Preview →"

═══════════════════════════════════════
SECTION 06 — WHY NOW (market opportunity)
═══════════════════════════════════════
Dark warm background (#211C19). White text. Pink accents.
Section number "05 / WHY NOW" at top in pink.

TOP HEADLINE (centered): "The market is ready."
Korean: "시장이 준비됐습니다."

Below, THREE LARGE STAT CARDS in a horizontal row.
Each card: subtle 1px white outline, dark background, 32px padding.

  STAT 1:
    Big number (Anta, 80pt, white): "$25B"
    Label: "Global SEL market by 2033"
    Korean (muted): "글로벌 SEL 시장 규모 (2033 예상)"
    Source (tiny, italic): "Market Data Forecast, 2025"
    
  STAT 2:
    Big number: "25%"
    Label: "CAGR — fastest-growing edtech segment"
    Korean: "연평균 성장률 — 가장 빠르게 성장하는 에듀테크"
    Source: "Market Data Forecast, 2025"
    
  STAT 3:
    Big number: "APAC"
    Label: "Fastest-growing region — Korea included"
    Korean: "가장 빠르게 성장하는 지역 — 한국 포함"
    Source: "MarketsandMarkets, 2024"

Below the stats, a single explanatory line (pink, italic):
"Social-Emotional Learning is the fastest-growing layer of 
 education technology — and questions are at its core."
Korean: "사회·정서 학습(SEL)은 에듀테크에서 가장 빠르게 성장하는 
       영역이며, 그 중심에는 '질문'이 있습니다."

═══════════════════════════════════════
SECTION 07 — CONTACT
═══════════════════════════════════════
Off-white background. Editorial spacious layout (two-column).

LEFT SIDE (50% width):
  Tiny label "06 / CONTACT" in pink, letterspaced
  
  Large headline (Anta):
  "Let's build the
   next conversation."
  Korean: "다음 대화를 함께 만듭니다."
  
  Paragraph: "We're talking with investors, schools, 
              and partners who want to design the future of 
              how people communicate."
  Korean: "투자자, 학교, 그리고 사람들의 소통 방식을 함께 
          설계할 파트너를 만나고 있습니다."

RIGHT SIDE (50% width): Three contact cards stacked vertically.
Each card: white background, thin border, 24px padding, hover effect.
  
  For Investors / 투자 문의
  invest@cammup.com
  "Funding rounds, due diligence, strategic partnerships"
  
  For Schools & Partners / 학교·파트너 문의
  partners@cammup.com
  "Pilots, classroom deployment, SEL collaboration"
  
  For Press / 미디어 문의
  press@cammup.com
  "Interviews, press materials, brand assets"

BOTTOM FOOTER BAR (full width, subtle top border):
LEFT: CAMMUP wordmark · "Human Interaction Platform"
RIGHT: "© 2026 CAMMUPLABS, Inc."

═══════════════════════════════════════
GLOBAL DESIGN PRINCIPLES
═══════════════════════════════════════
- Sticky top nav, consistent across all sections (Hero has 
  transparent variant)
- Right edge: vertical snap dots (7 total, current highlighted 
  in pink, clickable to navigate)
- All Korean text smaller than English (about 65-70%), in muted 
  gray (#6B6159), never the primary headline
- Numbers are HEROES — when displaying stats, oversized and editorial
- No rounded cards over 24px radius (avoid soft consumer look)
- Section background rhythm:
  Hero (image) → off-white → DARK → off-white → off-white → 
  DARK → off-white
- Smooth scroll behavior with proper snap-stop
- All buttons and cards have subtle hover states (slight scale, 
  shadow, or color shift)
- Mobile responsive: stack columns vertically, reduce padding to 
  20-40px, headlines 60% of desktop size
```

---

## 🔧 Quick Fix Prompts (use after first generation)

If Figma Make doesn't get a section right on the first try, paste one of these to fix just that section. You can chat with Make naturally — no need to regenerate the whole page.

### Hero issues
```
The Hero section uses the wrong background. Please use the uploaded 
reference image (iridescent water-bubble image) as the full-screen 
background. Add a 25% dark gradient overlay only at the bottom half 
to keep text readable while preserving the bubbles' beauty.
```

### Hero animation not working
```
The Hero background image should have a "breathing" CSS animation: 
slow 3-5px vertical drift over 8 seconds, plus opacity pulse from 
90% to 100% over 4 seconds. Make sure these animations are actually 
running, not just static.
```

### Roadmap looks like cards instead of timeline
```
Section 04 Roadmap should be a TRUE HORIZONTAL TIMELINE, not just 
three cards. Draw a thin horizontal line across the middle, place 
three dots evenly on the line for years 2026/2027/2028, with year 
labels above and detailed stage cards below. The line and dots are 
the visual anchor.
```

### Statistics numbers too small
```
The numbers in Section 02 ("63.2%", "88%", "+16%p") and Section 06 
("$25B", "25%", "APAC") should be MUCH larger — use Anta font at 
96-120pt. The numbers should dominate their cards visually.
```

### Too pastel / too cute
```
Reduce all pastel colors. The only consistent accents should be 
brand pink (#FF0051) and ink navy (#1E2A44). Use peach, sage, and 
sky only as tiny indicator dots or small accents. Overall feel 
should be professional and editorial, not consumer-startup cute.
```

### Korean text too prominent
```
Korean text should always be:
- Smaller than English (about 65-70% of the size)
- In muted gray (#6B6159)
- Positioned below English text, never as the primary headline
English carries the primary visual weight in every section.
```

### Snap scroll not working
```
The page should snap-scroll between sections. Each section is 
exactly 100vh. When the user scrolls, the next section should 
snap into view smoothly. The 7 dots on the right edge should be 
clickable and navigate to each section.
```

### Nav not adapting to backgrounds
```
The top nav should change color based on the section below it:
- Over light (off-white) sections: dark text
- Over dark (warm black) sections: white text  
- Over Hero image: dark text (top of image is light)
The transition should be smooth as the user scrolls.
```

---

## 🎁 Figma Make Special Features to Try

### 1. Generate Mobile Version
After desktop is good, try:
```
Generate a responsive mobile version of this design at 375×812. 
Stack all multi-column sections vertically. Reduce padding to 
20-40px. Headlines at 60% of desktop size. Keep the snap-scroll 
behavior and snap indicators (move them to bottom on mobile).
```

### 2. Make Contact Forms Functional
```
In Section 07 Contact, make the three email addresses clickable 
mailto: links. Add a small "Copy email" button on hover that 
copies the email to clipboard with a brief success message.
```

### 3. Add Sound Toggle for Hero (when video is added later)
```
Add a small mute/unmute toggle in the bottom-right corner of the 
Hero section. It's prepared for future video integration. The 
button uses a speaker icon with subtle backdrop blur.
```

### 4. Publish to URL
After everything looks good:
- Click "Publish" in Figma Make
- You'll get a `figma.site` URL
- Share with investors or test on real devices

### 5. Copy to Figma Design
- Click "Open in Figma" or "Copy as design layers"
- The design appears in your CAMMUP Figma file
- Fine-tune typography, alignment, spacing in Figma Design

---

## 📋 Workflow Summary

```
1. Open Figma Make → New project
2. Upload Image 4 (iridescent bubbles)
3. Paste the main prompt above
4. Wait for generation (1-2 min)
5. Review live preview
6. Use Quick Fix Prompts for any issues
7. Generate mobile version
8. Publish to URL (optional) OR Copy to Figma Design
9. Fine-tune in Figma Design with our existing CAMMUP file
10. Replace Hero static image with video later (when ready)
```

---

## ✅ What to Expect

### Likely to work well first time
- Section 02 (Problem) — clean data layout
- Section 03 (Thesis) — minimal text-focused
- Section 05 (Products) — clear card structure
- Section 07 (Contact) — two-column layout
- Snap-scroll behavior
- Korean/English bilingual layout

### May need quick fix
- Section 01 (Hero) — image placement and overlay
- Section 04 (Roadmap) — timeline often becomes cards
- Statistics size — numbers often come out too small
- Animation behavior — Hero "breathing" might not activate

### Almost certain to need adjustment
- Mobile version optimization
- Nav color adaptation across sections
- Korean text proportions

Don't worry about perfection on first generation — Figma Make is iterative. Each Quick Fix Prompt nudges it closer to your vision.

---

## 💡 Pro Tips

1. **Be specific in fixes** — "Make it bigger" is vague. "Increase the Hero headline to 96pt" works better.

2. **One thing at a time** — Don't ask Make to fix 5 things at once. Iterate one section/element at a time.

3. **Save versions** — Figma Make keeps version history. After good iterations, save a snapshot before trying risky changes.

4. **Use Korean directly** — You can write fix prompts in Korean too: "이 부분을 더 크게 만들어줘" works.

5. **Reference existing designs** — "Match the style of [reference URL or screenshot]" can help.

---

*Document version: Figma Make Final*
*Project: CAMMUP Company Website*
*Last updated: May 2026*