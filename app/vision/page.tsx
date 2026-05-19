"use client";
import { useState } from "react";
import Nav from "@/components/Nav";

const stages = [
  {
    year: "2026",
    stage: "Stage 1.0",
    color: "#FF0051",
    titleEn: "TalkBingo",
    titleKr: "TalkBingo",
    type: { en: "B2C · Consumer", kr: "B2C · 소비자" },
    status: { en: "● LIVE", kr: "● 출시" },
    desc: { en: "A game-based chat platform for real conversation. Where empathy completes the line.", kr: "공감이 빙고를 완성하는 게임 기반 대화 플랫폼." },
  },
  {
    year: "2027",
    stage: "Stage 2.0",
    color: "#1E2A44",
    titleEn: "Debate Platform for Class",
    titleKr: "Debate Platform for Class",
    type: { en: "B2B · Education", kr: "B2B · 교육" },
    status: { en: "● In Development", kr: "● 개발 중" },
    desc: { en: "AI-driven debate designed for the classroom.", kr: "발언하는 법을 가르치는 AI 기반 토론 플랫폼." },
  },
  {
    year: "2028",
    stage: "Stage 3.0",
    color: "#6B8F71",
    titleEn: "Generational AI Mediator",
    titleKr: "세대간 AI 중재자",
    type: { en: "B2B / Research", kr: "B2B / 연구" },
    status: { en: "○ R&D", kr: "○ R&D" },
    desc: { en: "An AI that translates between generations.", kr: "세대 간 통역사가 되는 AI." },
  },
];

export default function VisionPage() {
  const [isKorean, setIsKorean] = useState(false);

  return (
    <div className="min-h-screen bg-[#FFFDFD]">
      <Nav isKorean={isKorean} onToggleLang={() => setIsKorean((v) => !v)} />

      <main className="max-w-[1440px] mx-auto px-5 md:px-10 lg:px-15 pt-[76px]">
        <div className="py-16 lg:py-24">
          <p className="text-[#FF0051] text-[11px] font-medium tracking-[1.5px] uppercase mb-5">
            {isKorean ? "비전 & 로드맵" : "Vision & Roadmap"}
          </p>
          <h1 className="text-[clamp(32px,5vw,56px)] font-normal leading-[1.15] text-[#211C19] mb-4">
            {isKorean ? "우리는 어디로 갑니다." : "Where we're going."}
          </h1>
          <p className="text-[#6B6159] text-sm md:text-base leading-relaxed max-w-[540px] mb-14">
            {isKorean
              ? "3단계 연구·제품 로드맵. 각 단계가 다음 단계의 데이터와 질문 자산이 됩니다."
              : "A three-stage roadmap. Each stage compounds the data and questions for the next."}
          </p>

          <div className="flex flex-col gap-4">
            {stages.map((s) => (
              <div
                key={s.year}
                className="border border-[#EDE5DB] rounded-sm p-6 hover:border-[#D9CFC2] hover:shadow-sm transition-all duration-200 group"
              >
                <div className="flex items-start gap-6">
                  {/* 연도 */}
                  <div className="flex-shrink-0 w-20 text-center">
                    <p className="text-3xl font-normal leading-none" style={{ color: s.color }}>
                      {s.year}
                    </p>
                    <p className="text-[10px] text-[#9A8E83] mt-1">{s.stage}</p>
                  </div>

                  {/* 내용 */}
                  <div className="flex-1">
                    <div className="flex items-center gap-2 mb-2">
                      <span
                        className="px-3 py-1 rounded-full text-[11px] font-semibold"
                        style={{ backgroundColor: `${s.color}1a`, color: s.color }}
                      >
                        {isKorean ? s.status.kr : s.status.en}
                      </span>
                      <span className="text-[11px] text-[#9A8E83]">
                        {isKorean ? s.type.kr : s.type.en}
                      </span>
                    </div>
                    <h2 className="text-xl font-semibold text-[#211C19] mb-1">
                      {isKorean ? s.titleKr : s.titleEn}
                    </h2>
                    <p className="text-sm text-[#6B6159] leading-relaxed">
                      {isKorean ? s.desc.kr : s.desc.en}
                    </p>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </main>
    </div>
  );
}
