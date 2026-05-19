"use client";

import { useState } from "react";
import Link from "next/link";
import { AnimatePresence, motion } from "framer-motion";
import Nav from "@/components/Nav";

// ─── 팝업 데이터 ──────────────────────────────────────────────────────────────

interface Popup {
  id: string;
  labelEn: string;
  labelKr: string;
  titleEn: string;
  titleKr: string;
  bodyEn: string;
  bodyKr: string;
}

const POPUPS: Popup[] = [
  {
    id: "problem",
    labelEn: "The Problem",
    labelKr: "문제 정의",
    titleEn: "Conversation is broken.",
    titleKr: "대화가 끊겼습니다.",
    bodyEn:
      "People talk more than ever — but connect less. Social media optimizes for reaction, not reflection. Messaging apps reduce conversation to quick replies. The result: people feel heard less, understood less, and lonelier than before.\n\nCAMMUPLABS exists because we believe the problem isn't volume — it's depth.",
    bodyKr:
      "사람들은 그 어느 때보다 많이 이야기하지만, 덜 연결됩니다. 소셜 미디어는 반응을 위해 최적화되어 있고, 메시지 앱은 대화를 빠른 답변으로 축소합니다. 결과적으로 사람들은 덜 경청받고, 덜 이해받으며, 이전보다 더 외롭습니다.\n\nCAMMUPLABS는 문제가 양이 아니라 깊이라고 믿기 때문에 존재합니다.",
  },
  {
    id: "thesis",
    labelEn: "Our Thesis",
    labelKr: "우리의 가설",
    titleEn: "Questions are the technology.",
    titleKr: "질문이 곧 기술입니다.",
    bodyEn:
      "The right question changes everything. It shifts perspective, opens empathy, and turns strangers into people who understand each other.\n\nWe're building a platform where questions are the core mechanic — not just prompts, but the architecture of connection itself.",
    bodyKr:
      "올바른 질문은 모든 것을 바꿉니다. 관점을 바꾸고, 공감을 열며, 낯선 사람들을 서로를 이해하는 사람들로 만듭니다.\n\n우리는 질문이 핵심 메커니즘인 플랫폼을 구축하고 있습니다 — 단순한 프롬프트가 아닌, 연결 자체의 아키텍처로서.",
  },
  {
    id: "roadmap",
    labelEn: "Roadmap",
    labelKr: "로드맵",
    titleEn: "Three stages of connection.",
    titleKr: "연결의 세 단계.",
    bodyEn:
      "Stage 1 — TalkBingo (2026, Live)\nA game where empathy completes the line. B2C, iOS & Android.\n\nStage 2 — Debate Platform for Class (2027)\nAI-driven structured debate for classrooms. B2B, Education.\n\nStage 3 — Generational AI Mediator (2028)\nAn AI that translates between generations. B2B / Research.",
    bodyKr:
      "Stage 1 — TalkBingo (2026, 출시)\n공감이 빙고를 완성하는 게임. B2C, iOS & Android.\n\nStage 2 — Debate Platform for Class (2027)\n교실을 위한 AI 기반 토론 플랫폼. B2B, 교육.\n\nStage 3 — 세대간 AI 중재자 (2028)\n세대 간 통역사가 되는 AI. B2B / 연구.",
  },
  {
    id: "whynow",
    labelEn: "Why Now",
    labelKr: "왜 지금인가",
    titleEn: "The timing is exact.",
    titleKr: "타이밍이 정확합니다.",
    bodyEn:
      "Post-pandemic loneliness is at record highs. Gen Z reports the lowest social confidence of any generation. AI is mature enough to power nuanced conversation design. And the EdTech market is actively looking for SEL solutions.\n\nThe window for a question-first communication platform is open right now.",
    bodyKr:
      "팬데믹 이후 외로움이 역대 최고치입니다. Z세대는 모든 세대 중 가장 낮은 사회적 자신감을 보고합니다. AI는 섬세한 대화 설계를 지원할 만큼 성숙했습니다. 그리고 에드테크 시장은 SEL 솔루션을 적극적으로 찾고 있습니다.\n\n질문 우선 커뮤니케이션 플랫폼의 창문이 지금 열려 있습니다.",
  },
  {
    id: "nowlive",
    labelEn: "Now Live",
    labelKr: "지금 출시",
    titleEn: "TalkBingo is live.",
    titleKr: "TalkBingo가 출시되었습니다.",
    bodyEn:
      "Our first product — TalkBingo — is available now on iOS and Android. It's a game where players answer questions, and empathy completes the bingo line.\n\nEarly users describe it as 'the most honest conversation I've had in years.' That's what we're building toward.",
    bodyKr:
      "우리의 첫 번째 제품인 TalkBingo가 iOS와 Android에서 지금 이용 가능합니다. 플레이어가 질문에 답하고, 공감이 빙고 줄을 완성하는 게임입니다.\n\n초기 사용자들은 이것을 '몇 년 만에 가장 솔직한 대화'라고 묘사합니다. 그것이 우리가 구축하는 방향입니다.",
  },
  {
    id: "contact",
    labelEn: "Contact",
    labelKr: "문의",
    titleEn: "Let's build together.",
    titleKr: "함께 만들어갑시다.",
    bodyEn:
      "We're talking with investors, schools, and partners who want to design the future of how people communicate.\n\ninvest@cammup.com — Funding & partnerships\npartners@cammup.com — Schools & pilots\npress@cammup.com — Media & press",
    bodyKr:
      "투자자, 학교, 그리고 사람들의 소통 방식을 함께 설계할 파트너를 만나고 있습니다.\n\ninvest@cammup.com — 투자 및 파트너십\npartners@cammup.com — 학교 및 파일럿\npress@cammup.com — 미디어 및 보도",
  },
];

// ─── 홈 페이지 ────────────────────────────────────────────────────────────────

export default function HomePage() {
  const [isKorean, setIsKorean] = useState(false);
  const [activePopup, setActivePopup] = useState<Popup | null>(null);

  return (
    <div className="min-h-screen bg-[#FFFDFD]">
      <Nav isKorean={isKorean} onToggleLang={() => setIsKorean((v) => !v)} />

      {/* Hero */}
      <main className="max-w-[1440px] mx-auto px-5 md:px-10 lg:px-15 pt-[76px] min-h-screen flex flex-col justify-center">
        <div className="py-20 lg:py-32">
          {/* 서브 태그 */}
          <p className="text-[#1880AC] text-sm md:text-base lg:text-[22px] font-normal mb-6">
            {isKorean
              ? "의미있는 대화를 위한 기술"
              : "A technology for meaningful conversation."}
          </p>

          {/* 메인 헤드라인 */}
          <h1 className="text-[clamp(36px,7vw,80px)] font-normal leading-[1.1] text-[#211C19] mb-8 lg:mb-12 max-w-[900px] whitespace-pre-line">
            {isKorean
              ? "CAMMUPLABS는\n질문을 연구합니다."
              : "CAMMUPLABS\nresearches questions."}
          </h1>

          {/* 설명 */}
          <p className="text-[#6B6159] text-sm md:text-base leading-relaxed mb-10 lg:mb-16 max-w-[540px] whitespace-pre-line">
            {isKorean
              ? "새로운 아이디어는 질문을 만들고,\n그 질문이 떠오르는 순간, 이미 시작된 가능성입니다."
              : "New ideas birth questions,\nand the moment one surfaces,\nit is already a possibility in motion."}
          </p>

          {/* 섹션 칩 버튼 */}
          <div className="flex flex-wrap gap-2 lg:gap-3 max-w-[760px] mb-10 lg:mb-14">
            {POPUPS.map((popup) => (
              <button
                key={popup.id}
                onClick={() => setActivePopup(popup)}
                className="px-4 py-2 lg:px-5 lg:py-2.5 text-xs lg:text-sm font-medium border border-[#EDE5DB] rounded-full text-[#211C19] hover:border-[#211C19] hover:bg-[#211C19] hover:text-[#FFFDFD] transition-all duration-150 cursor-pointer"
              >
                {isKorean ? popup.labelKr : popup.labelEn}
              </button>
            ))}
          </div>

          {/* CTA */}
          <div className="flex gap-3">
            <Link
              href="/contact"
              className="px-6 py-3 bg-[#211C19] text-[#FFFDFD] text-sm font-medium rounded-full hover:opacity-80 transition-opacity"
            >
              {isKorean ? "문의하기" : "Get in touch"}
            </Link>
            <Link
              href="/company"
              className="px-6 py-3 border border-[#EDE5DB] text-[#211C19] text-sm font-medium rounded-full hover:border-[#211C19] transition-colors"
            >
              {isKorean ? "회사 소개" : "About us"}
            </Link>
          </div>
        </div>
      </main>

      {/* 팝업 오버레이 */}
      <AnimatePresence>
        {activePopup && (
          <>
            <motion.div
              key="backdrop"
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              transition={{ duration: 0.2 }}
              className="fixed inset-0 bg-black/30 z-40 backdrop-blur-sm"
              onClick={() => setActivePopup(null)}
            />
            <motion.div
              key="panel"
              initial={{ opacity: 0, y: 24 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: 24 }}
              transition={{ duration: 0.25, ease: "easeOut" }}
              className="fixed bottom-0 left-0 right-0 md:bottom-auto md:top-1/2 md:left-1/2 md:-translate-x-1/2 md:-translate-y-1/2 z-50 md:w-[560px] bg-[#FFFDFD] rounded-t-2xl md:rounded-2xl shadow-2xl max-h-[80vh] flex flex-col"
            >
              <div className="flex items-center justify-between px-6 py-5 border-b border-[#EDE5DB] flex-shrink-0">
                <h2 className="text-base font-semibold text-[#211C19]">
                  {isKorean ? activePopup.titleKr : activePopup.titleEn}
                </h2>
                <button
                  onClick={() => setActivePopup(null)}
                  className="text-[#9A8E83] hover:text-[#211C19] transition-colors text-lg leading-none cursor-pointer ml-4"
                >
                  ✕
                </button>
              </div>
              <div className="px-6 py-5 overflow-y-auto scrollbar-hide">
                {(isKorean ? activePopup.bodyKr : activePopup.bodyEn)
                  .split("\n\n")
                  .map((para, i) => (
                    <p
                      key={i}
                      className="text-[#6B6159] text-sm leading-relaxed mb-4 last:mb-0 whitespace-pre-line"
                    >
                      {para}
                    </p>
                  ))}
              </div>
            </motion.div>
          </>
        )}
      </AnimatePresence>
    </div>
  );
}
