# CAMMUP Design System

TalkBingo / CAMMUP 웹사이트 및 모든 제품에 일관된 디자인을 적용하기 위한 디자인 시스템입니다.

---

## 📁 폴더 구조

```
lib/
├── cammup_ds.dart          ← 진입점 (한 줄 import)
├── tokens/
│   ├── colors.dart          ← 색상 (Palette + Semantic)
│   ├── spacing.dart         ← 간격, 라운드, 그림자, 모션, 브레이크포인트
│   └── typography.dart      ← Alexandria(영) + Elice(한) 폰트 시스템
├── theme/
│   └── app_theme.dart       ← Flutter ThemeData 통합
├── components/
│   ├── buttons.dart         ← PrimaryButton, ChipButton, TextLinkButton
│   ├── glass_container.dart ← 유리(frosted glass) 컨테이너
│   └── speech_bubble.dart   ← 말풍선 (4방향 꼬리 지원)
└── utils/
    └── responsive.dart      ← context.isMobile, context.responsive() 등
```

---

## 🚀 시작하기

### 1. pubspec.yaml 설정

```yaml
flutter:
  fonts:
    - family: Alexandria
      fonts:
        - asset: assets/fonts/Alexandria-Regular.ttf
        - asset: assets/fonts/Alexandria-Medium.ttf
          weight: 500
        - asset: assets/fonts/Alexandria-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/Alexandria-Bold.ttf
          weight: 700
    - family: EliceDigitalBaeum
      fonts:
        - asset: assets/fonts/EliceDigitalBaeum-Regular.ttf
        - asset: assets/fonts/EliceDigitalBaeum-Bold.ttf
          weight: 700
```

폰트 파일을 `assets/fonts/`에 넣으세요.

### 2. MaterialApp에 테마 적용

```dart
import 'package:cammup_ds/cammup_ds.dart';

MaterialApp(
  theme: AppTheme.light,
  home: MyPage(),
)
```

### 3. 컴포넌트 사용

```dart
import 'package:cammup_ds/cammup_ds.dart';
```

이 한 줄이면 모든 토큰과 컴포넌트가 사용 가능합니다.

---

## 🎨 색상 시스템

### 사용 규칙
- **직접 hex 값을 쓰지 마세요.** 항상 `AppColors.xxx` 시맨틱 토큰을 사용하세요.
- `_Palette`는 내부용입니다. 새 색이 필요하면 Palette에 추가하고 AppColors에 시맨틱 이름으로 노출하세요.

### 주요 색상

| 토큰 | 값 | 용도 |
|---|---|---|
| `AppColors.surface` | `#FFFDFB` | 메인 배경 |
| `AppColors.surfaceGlass` | `rgba(255,253,251,0.2)` | 유리 statusbar 배경 |
| `AppColors.textPrimary` | `#211C19` | 메인 텍스트, CTA 버튼 배경 |
| `AppColors.textSecondary` | `#6B6159` | 서브 텍스트 |
| `AppColors.accent` | `#FF0051` | 브랜드 핑크 (강조) |
| `AppColors.border` | `#EDE5DB` | 보더 |
| `AppColors.bubbleDefault` | `#DEF0F8` | 말풍선 기본 배경 |

### 섹션별 색상

```dart
Color color = SectionColors.bubbleFor(index); // 0~5
```

지금은 모든 섹션이 동일 색이지만, 추후 섹션별로 다른 색을 쓰고 싶을 때 `SectionColors`만 수정하면 됩니다.

---

## ✍️ 타이포그래피

### 폰트 자동 전환 원리
모든 텍스트 스타일은 `fontFamily: 'Alexandria'` + `fontFamilyFallback: ['EliceDigitalBaeum', 'sans-serif']`로 설정돼 있습니다.

Flutter는 글리프(문자) 단위로 폰트를 시도합니다:
- 영문자/숫자/기호 → Alexandria에 글리프 있음 → Alexandria로 렌더링
- 한글 → Alexandria에 글리프 없음 → Elice Digitalbaeum으로 렌더링

따라서 `Text('Hello 안녕하세요')` 한 줄에서도 영어는 Alexandria, 한글은 Elice로 자동 표시됩니다.

### 타입 스케일

| 스타일 | 크기 | 용도 |
|---|---|---|
| `AppText.displayDesktop` | 80px / 400 | Hero 메인 (데스크탑) |
| `AppText.displayTablet` | 64px / 400 | Hero 메인 (태블릿) |
| `AppText.displayMobile` | 36px / 400 | Hero 메인 (모바일) |
| `AppText.h1` | 40px / 600 | 페이지 제목 |
| `AppText.h2` | 32px / 600 | 섹션 제목 |
| `AppText.h3` | 28px / 600 | 카드/팝업 제목 |
| `AppText.h4` | 22px / 600 | 소제목 |
| `AppText.bodyLarge` | 22px / 400 | Hero 서브 메시지 |
| `AppText.bodyMedium` | 18px / 400 | 본문 (태블릿) |
| `AppText.bodyBase` | 15px / 400 | 본문 (모바일/팝업 설명) |
| `AppText.bodySmall` | 13px / 400 | 보조 본문 |
| `AppText.label` | 14px / 500 | 네비 카테고리, 라벨 |
| `AppText.labelSmall` | 12px / 500 | EN/KR, 작은 라벨 |
| `AppText.button` | 12px / 500 | 버튼 텍스트 |
| `AppText.chipDesktop` | 10px / 500 | 팝업 버튼 (데스크탑/태블릿) |
| `AppText.chipMobile` | 9px / 500 | 팝업 버튼 (모바일) |

### 헬퍼 확장

```dart
Text('강조', style: AppText.h3.accent)        // 핑크 컬러
Text('subtitle', style: AppText.bodyBase.secondary)
Text('Bold', style: AppText.h2.bold)           // FontWeight.w700
Text('Custom', style: AppText.label.withColor(Colors.purple))
```

---

## 📐 간격 / 라운드 / 그림자

### Spacing (8pt 기반)
```dart
AppSpacing.xxs  // 4
AppSpacing.xs   // 8
AppSpacing.sm   // 12
AppSpacing.md   // 16
AppSpacing.lg   // 20
AppSpacing.xl   // 24
AppSpacing.xxl  // 32
AppSpacing.xxxl // 40
AppSpacing.huge // 60
```

### Page padding
```dart
final padding = context.pagePadding; // 자동으로 24/40/60 분기
```

### Radius
```dart
AppRadius.xs    // 8
AppRadius.sm    // 12
AppRadius.md    // 14  - 팝업 버튼
AppRadius.lg    // 18  - CTA 버튼
AppRadius.xl    // 22  - 햄버거, 드롭다운
AppRadius.xxl   // 50  - 말풍선
AppRadius.pill  // 999 - 완전 알약
```

### Shadow
```dart
AppShadow.soft    // 살짝 떠 있는 카드
AppShadow.medium  // 말풍선, 드롭다운
AppShadow.strong  // 모달
```

### Motion
```dart
AppMotion.fast        // 150ms - 호버, 작은 피드백
AppMotion.base        // 220ms - 일반 트랜지션
AppMotion.slow        // 350ms - 큰 화면 변화
AppMotion.deliberate  // 500ms - 강조된 진입

AppMotion.easeOut
AppMotion.emphasized  // Material 3 emphasized curve
```

---

## 📱 반응형

### 브레이크포인트
```
mobile  : 0     ~ 767px
tablet  : 768   ~ 1023px
desktop : 1024 px 이상
```

### 사용법

```dart
// 디바이스 체크
if (context.isMobile) { ... }
if (context.isDesktop) { ... }
if (context.isHandheld) { ... }  // mobile + tablet

// 값 분기
final padding = context.responsive(
  mobile: 16.0,
  tablet: 24.0,
  desktop: 40.0,
);

// 텍스트 스타일 분기
final heroStyle = context.responsive(
  mobile: AppText.displayMobile,
  tablet: AppText.displayTablet,
  desktop: AppText.displayDesktop,
);

// 위젯 분기
ResponsiveBuilder(
  mobile: MobileHero(),
  tablet: TabletHero(),
  desktop: DesktopHero(),
)
```

---

## 🧩 컴포넌트

### PrimaryButton — CTA
```dart
PrimaryButton(
  label: 'Get in touch',
  onTap: () => print('tap'),
)

// 큰 사이즈
PrimaryButton(
  label: 'Get started',
  onTap: () {},
  large: true,
)
```

### ChipButton — 알약형
```dart
ChipButton(
  label: '01 / The Problem',
  onTap: () {},
  isActive: false,
  isHighlighted: true,  // 핑크 텍스트
  mobileSize: context.isMobile,
)
```

### GlassContainer — 유리
```dart
// 일반
GlassContainer(
  blur: 12,
  tint: AppColors.surfaceGlass,
  borderRadius: BorderRadius.circular(AppRadius.lg),
  child: ...,
)

// 프리셋
GlassContainer.statusBar(child: NavBar())
GlassContainer.card(child: Content())
```

### SpeechBubble — 말풍선
```dart
SpeechBubble(
  color: AppColors.bubbleDefault,
  tailDirection: TailDirection.down,
  tailOffset: 0.5, // 0~1 비율, 또는 픽셀 (>1)
  child: Column(children: [
    Text('제목', style: AppText.h3),
    Text('설명', style: AppText.bodyBase),
  ]),
)
```

---

## 🛠️ 새 컴포넌트 만들 때 규칙

1. **항상 토큰을 사용하세요.** `Color(0xFF...)`나 `padding: 16` 같은 매직 넘버를 직접 쓰지 마세요. `AppColors.xxx`, `AppSpacing.md`를 쓰세요.

2. **새 색이 필요하면** `colors.dart`의 `_Palette`에 추가하고 `AppColors`에 시맨틱 이름으로 노출하세요. 컴포넌트 안에 hex를 박지 마세요.

3. **반응형이 필요하면** `context.responsive(...)`를 사용하세요. `MediaQuery.of(context).size.width >= 1024` 같은 분기를 컴포넌트마다 반복하지 마세요.

4. **모션은** `AppMotion.base` 같은 표준 duration/curve를 사용하세요.

5. **글꼴은 직접 지정하지 마세요.** `AppText.xxx`를 사용하면 한/영 자동 전환이 됩니다.

6. **컴포넌트 한 줄 import**: 새 컴포넌트를 만들었으면 `cammup_ds.dart` barrel에 export 추가하세요.

---

## 📋 향후 추가 예정

- [ ] 섹션별 다른 말풍선 색상 (`SectionColors.bubbleFor()` 확장)
- [ ] Dark mode 토큰
- [ ] 아이콘 시스템 (lucide_icons 또는 SVG asset)
- [ ] Card 컴포넌트 (Hero 외 일반 콘텐츠용)
- [ ] FormField 컴포넌트 (Contact 폼용)
- [ ] AppBar / Footer 표준 위젯
- [ ] 마이크로 인터랙션 (hover, focus 상태)

---

## 🔗 참고

- Figma: [TalkBingo Company Website](https://www.figma.com/design/uoFmXgCiqbBqUnZiPbtREQ)
- 폰트:
  - [Alexandria (Google Fonts)](https://fonts.google.com/specimen/Alexandria)
  - [Elice Digital Baeum](https://font.elice.io/) (Elice 무료 폰트)
