# CAMMUPLABS About 페이지 — 개정안 v3 (글로벌 중심)

**개정 방향:** v2 대비 글로벌 무게중심 강화. 한국은 "선행 지표"로만 한 번 언급, 나머지는 모두 글로벌·과학·인류의 문제.

---

## v2 → v3 무게중심 변화

| 섹션 | v2 (한국 비중) | v3 (한국 비중) |
|---|---|---|
| 히어로 | "세대, 교실, 문화" | 동일 — 글로벌 어휘 |
| 01 문제 | 글로벌 2 + 한국 1 | **글로벌 3** (한국 1개는 본문에 짧게만) |
| 02 가설 | 글로벌 과학 3 | 동일 (이미 글로벌) |
| 03 회사 | "한국 + 세계" 균형 | **"세계를 위해 만들고, 한국에서 시작한다"** |

---

## 새 About 페이지 콘텐츠 (JSON 형식)

```json
{
  "_파일": "about.html",

  "히어로": {
    "태그_EN": "ABOUT CAMMUPLABS",
    "태그_KR": "CAMMUPLABS 소개",
    "제목_EN": "We exist because conversations matter.",
    "제목_KR": "대화가 중요하기 때문에 우리가 존재합니다.",
    "부제목_EN": "CAMMUPLABS builds the technology of questions — the architecture of how people connect across generations, classrooms, and cultures.",
    "부제목_KR": "CAMMUPLABS는 질문의 기술을 구축합니다 — 세대, 교실, 문화를 넘어 사람들이 연결되는 방식의 아키텍처입니다."
  },

  "섹션1_문제_정의": {
    "태그_EN": "01 / THE PROBLEM",
    "태그_KR": "01 / 문제 정의",

    "제목_EN": "The world is in a connection emergency.",
    "제목_KR": "세계는 연결의 비상사태에 있습니다.",

    "본문1_EN": "In May 2023, the U.S. Surgeon General declared loneliness a public health epidemic — comparable to smoking 15 cigarettes a day. Two years later, the WHO followed: more than 871,000 deaths every year are now linked to social disconnection. The UK has appointed a Minister for Loneliness. Japan has passed a national law. This is no longer a quiet cultural shift — it is a measurable global crisis.",
    "본문1_KR": "2023년 5월, 미국 의무총감은 외로움을 공중보건 유행병으로 선언했습니다 — 하루 담배 15개비를 피우는 것과 같은 사망 위험입니다. 2년 뒤 WHO도 동참했습니다: 매년 87만 1천 명 이상의 죽음이 사회적 단절과 연결되어 있습니다. 영국은 외로움 담당 장관을 임명했고, 일본은 관련 법률을 제정했습니다. 이것은 더 이상 조용한 문화적 변화가 아닙니다 — 측정 가능한 글로벌 위기입니다.",

    "본문2_EN": "People talk more than ever, but connect less. Social media optimizes for reaction, not reflection. Messaging apps reduce conversation to quick replies. The problem isn't volume — it's depth.",
    "본문2_KR": "사람들은 그 어느 때보다 많이 이야기하지만, 더 적게 연결됩니다. 소셜 미디어는 반응을 위해 최적화되어 있습니다. 메시지 앱은 대화를 빠른 답변으로 축소합니다. 문제는 양이 아닙니다 — 깊이입니다.",

    "본문3_EN": "CAMMUPLABS exists to rebuild the architecture of meaningful conversation — starting with the one thing that has always shifted perspective: the right question.",
    "본문3_KR": "CAMMUPLABS는 의미 있는 대화의 구조를 재건하기 위해 존재합니다 — 항상 관점을 바꿔온 한 가지, 바로 올바른 질문에서 시작합니다.",

    "통계": {
      "stat1": {
        "수치": "871,000+",
        "라벨_EN": "deaths every year are linked to social disconnection — more than 100 every hour, worldwide.",
        "라벨_KR": "매년 사회적 단절과 관련된 사망자 — 전 세계 시간당 100명 이상.",
        "출처_EN": "WHO Commission on Social Connection, 2025",
        "출처_KR": "WHO 사회적 연결 위원회, 2025"
      },
      "stat2": {
        "수치": "1 in 5",
        "라벨_EN": "of the world's employees experience loneliness every single day. Among those under 35, the rate is higher still.",
        "라벨_KR": "전 세계 직장인이 매일 외로움을 경험합니다. 35세 미만은 그 비율이 더 높습니다.",
        "출처_EN": "Gallup, State of the Global Workplace 2024 — 160 countries, 128,000+ employees",
        "출처_KR": "Gallup, 글로벌 직장 보고서 2024 — 160개국, 12.8만 명 조사"
      },
      "stat3": {
        "수치": "15.8%",
        "라벨_EN": "of people worldwide feel lonely. Among adolescents aged 13–17 — the generation just entering adulthood — the rate climbs to 20.9%.",
        "라벨_KR": "전 세계 인구가 외로움을 느낍니다. 막 성인이 되는 13–17세 청소년에서는 20.9%로 더 높아집니다.",
        "출처_EN": "WHO Commission on Social Connection, 153 countries, 2025",
        "출처_KR": "WHO 사회적 연결 위원회, 153개국 조사, 2025"
      }
    }
  },

  "섹션2_우리의_가설": {
    "태그_EN": "02 / OUR THESIS",
    "태그_KR": "02 / 우리의 가설",

    "제목_EN": "Questions are the technology.",
    "제목_KR": "질문이 곧 기술입니다.",

    "부제목_EN": "The right question shifts perspective, opens empathy, and turns strangers into people who understand each other. This isn't poetry — it's three decades of peer-reviewed science.",
    "부제목_KR": "올바른 질문은 관점을 바꾸고 공감을 열며, 낯선 사람들을 서로를 이해하는 사람들로 만듭니다. 이건 시적 표현이 아니라, 30년간 동료심사로 검증된 과학입니다.",

    "카드1": {
      "번호": "01",
      "제목_EN": "Questions, not messages.",
      "제목_KR": "메시지가 아니라 질문입니다.",
      "설명_EN": "Harvard research (Huang et al., 2017) found that people who ask more questions — especially follow-up questions — are significantly more liked, more trusted, and more remembered. Messages inform. Questions transform.",
      "설명_KR": "하버드 연구(Huang 외, 2017)는 더 많은 질문을 — 특히 후속 질문을 — 하는 사람이 호감, 신뢰, 기억에서 모두 유의미하게 앞선다는 것을 발견했습니다. 메시지는 정보를 전달합니다. 질문은 변화를 만듭니다.",
      "출처_EN": "Huang et al. (2017), Journal of Personality and Social Psychology",
      "출처_KR": "Huang 외 (2017), Journal of Personality and Social Psychology"
    },

    "카드2": {
      "번호": "02",
      "제목_EN": "Designed, not random.",
      "제목_KR": "우연이 아니라 설계입니다.",
      "설명_EN": "In 1997, psychologist Arthur Aron showed that 45 minutes of carefully sequenced questions could turn strangers into intimates. Good conversation isn't an accident — it has structure: the right sequence, the right depth, the right context for each pair of people.",
      "설명_KR": "1997년, 심리학자 아서 아론은 45분간의 신중하게 설계된 질문이 낯선 사람을 가까운 사이로 만들 수 있음을 증명했습니다. 좋은 대화는 우연이 아닙니다 — 구조가 있습니다: 각 대화 쌍에 맞는 올바른 순서, 깊이, 맥락.",
      "출처_EN": "Aron et al. (1997), Personality and Social Psychology Bulletin",
      "출처_KR": "Aron 외 (1997), Personality and Social Psychology Bulletin"
    },

    "카드3": {
      "번호": "03",
      "제목_EN": "Mediation, not replacement.",
      "제목_KR": "대체가 아니라 중재입니다.",
      "설명_EN": "Published in Science (2024), Google DeepMind's 'Habermas Machine' showed AI can mediate between humans better than trained human facilitators — without replacing them. We're building the same architecture, but with questions at the core, for everyday human connection.",
      "설명_KR": "Science지에 발표된(2024) Google DeepMind의 '하버마스 머신'은 AI가 훈련된 인간 진행자보다 사람들 사이를 더 잘 중재할 수 있음을 — 인간을 대체하지 않고 — 입증했습니다. 우리는 같은 아키텍처를 질문을 핵심으로, 일상의 인간 연결을 위해 만듭니다.",
      "출처_EN": "Tessler, Bakker et al. (2024), Science",
      "출처_KR": "Tessler, Bakker 외 (2024), Science"
    },

    "마무리_EN": "CAMMUPLABS researches and builds the question-engineering layer of human-AI interaction — not just prompts, but the architecture of connection itself.",
    "마무리_KR": "CAMMUPLABS는 인간-AI 상호작용의 질문 엔지니어링 레이어를 연구하고 구축합니다 — 단순한 프롬프트가 아닌, 연결 자체의 아키텍처입니다."
  },

  "섹션3_회사_소개": {
    "태그_EN": "03 / THE COMPANY",
    "태그_KR": "03 / 회사 소개",

    "부제목_EN": "CAMMUPLABS is a Human Interaction Platform company — building for the world, starting where the future is arriving first.",
    "부제목_KR": "CAMMUPLABS는 인간 상호작용 플랫폼 회사입니다 — 세계를 위해 만들고, 미래가 가장 먼저 도착하는 곳에서 시작합니다.",

    "문단1_EN": "We started with a simple observation: the conversations that matter most — between parents and children, between students and teachers, between people of different generations — are becoming harder, shorter, and shallower. Everywhere.",
    "문단1_KR": "우리는 단순한 관찰에서 시작했습니다: 부모와 자녀 사이, 학생과 교사 사이, 다른 세대 사람들 사이의 가장 중요한 대화들이 점점 더 어렵고, 짧아지고, 얕아지고 있다는 것입니다. 어디에서나.",

    "문단2_EN": "We believe the solution isn't more content, more notifications, or more screen time. It's better questions — questions that create the conditions for real conversation: curiosity, vulnerability, and the willingness to be changed by another person.",
    "문단2_KR": "우리는 해결책이 더 많은 콘텐츠, 더 많은 알림, 더 많은 화면 시간이 아니라고 믿습니다. 더 좋은 질문입니다 — 진정한 대화의 조건을 만드는 질문: 호기심, 취약성, 그리고 다른 사람에 의해 변화될 의지.",

    "문단3_EN": "Three stages. TalkBingo is live on iOS and Android — questions for families, couples, and friends. A structured discussion platform for classrooms is in development. Community hardware for libraries, senior centers, and intergenerational spaces is in research. Each product is built on the same core: questions as the architecture of connection.",
    "문단3_KR": "세 단계. 톡빙고는 iOS와 Android에서 출시되었습니다 — 가족, 연인, 친구를 위한 질문. 교실용 구조화된 토론 플랫폼이 개발 중입니다. 도서관, 노인복지관, 세대 간 공간을 위한 커뮤니티 하드웨어는 연구 단계입니다. 모든 제품의 핵심은 같습니다 — 질문을 연결의 구조로 삼는 것.",

    "문단4_EN": "We chose to start in Korea — a country with one of the OECD's lowest social-support scores, where the future of disconnection is arriving first. What works here will travel.",
    "문단4_KR": "우리는 한국에서 시작하기로 선택했습니다 — OECD에서 가장 낮은 사회적 지지 수준 중 하나를 가진 나라, 단절의 미래가 가장 먼저 도착하는 곳입니다. 여기서 작동하는 것은 어디로든 갈 수 있습니다.",

    "문단5_EN": "We're building for the long term. The question-engineering layer of human communication is not a feature — it's a new category. And we intend to define it.",
    "문단5_KR": "우리는 장기적으로 구축합니다. 인간 소통의 질문 엔지니어링 레이어는 기능이 아닙니다 — 새로운 카테고리입니다. 그리고 우리는 그것을 정의하고자 합니다."
  }
}
```

---

## v2와 비교했을 때 달라진 점

### 1) 01 문제 정의 — 통계 3개를 **모두 글로벌**로

**v2:**
- WHO 87만 명 (글로벌)
- Gallup 5명 중 1명 (글로벌)
- 한국 54만 명 (한국 선행 지표)

**v3:**
- WHO 87만 명 (글로벌)
- Gallup 5명 중 1명 (글로벌)
- **WHO 청소년 외로움 20.9%** (글로벌, 153개국) ← 한국 통계를 청소년 글로벌 통계로 교체

또한 본문에 **영국 외로움 장관 + 일본 관련 법률** 한 줄 추가 — 정부 차원의 글로벌 합의 신호.

### 2) 03 회사 소개 — "한국에서 시작" 한 문단으로 압축

**v2:** "캐나다 기반, 한국과 세계를 위해 만든다" → 한국이 균형 잡힌 한 축

**v3:** "세계를 위해 만든다 + 한국은 시작점" → 한국을 **전략적 선택**으로 위치 조정

핵심 한 문장:
> *"We chose to start in Korea — a country with one of the OECD's lowest social-support scores, where the future of disconnection is arriving first. What works here will travel."*
> *"우리는 한국에서 시작하기로 선택했습니다 — OECD에서 가장 낮은 사회적 지지 수준 중 하나를 가진 나라, 단절의 미래가 가장 먼저 도착하는 곳입니다. 여기서 작동하는 것은 어디로든 갈 수 있습니다."*

이 한 문장이 v3의 핵심이에요. 한국이 약점이 아니라, **선택된 시작점**이라는 명제를 명확히 합니다.

### 3) 가설 섹션 — 각주 형식 출처 추가

각 카드 하단에 학술 인용 한 줄을 추가했어요. 글로벌 투자자와 학계 청중에게 신뢰도를 즉시 확보합니다.

---

## 톤 비교 한눈에 — 한 문장씩

| 항목 | v2 | v3 |
|---|---|---|
| 문제 1번 문장 | "세계는 연결의 비상사태에 있습니다." | 동일 |
| 통계 3 | 한국 54만 명 | **WHO 청소년 20.9%** |
| 회사 정체성 | "한국과 세계를 위해" | **"세계를 위해 만들고, 한국에서 시작"** |
| 한국 언급 횟수 | 4회 | **2회** (선행 지표 + 시작점) |
| 글로벌 데이터 출처 | WHO, Gallup, 한국 정부 | **WHO×2, Gallup, 미국 의무총감, 영국, 일본** |

---

## 다음 단계 제안

이 v3 콘텐츠를 보시고:

1. **이대로 좋다** → Flutter 코드에 바로 붙일 수 있게 최종 JSON으로 정리
2. **너무 글로벌로 갔다** → v2와 v3 사이로 조정
3. **특정 문단 톤만 바꾸고 싶다** → 어떤 부분을 어떻게 바꿀지 알려주세요
4. **04 TIMELINE 섹션 추가하고 싶다** → Anna의 창업 스토리 + 마일스톤 추가
