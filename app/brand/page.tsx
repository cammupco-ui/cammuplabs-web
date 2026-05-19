"use client";
import { useState } from "react";
import Nav from "@/components/Nav";

const products = [
  {
    name: "TalkBingo",
    accentBg: "#FFE5EE",
    accentText: "#FF0051",
    type: "B2C",
    status: { en: "● Live", kr: "● 출시" },
    tagline: {
      en: "Game-based communication.\nEmpathy is the rule that completes the line.",
      kr: "공감으로 완성되는 게임 기반 대화.",
    },
    features: {
      en: ["AI-generated questions", "Empathy-driven gameplay", "iOS · Android"],
      kr: ["AI 질문 생성", "공감 기반 게임플레이", "iOS · Android"],
    },
    cta: { en: "Visit page →", kr: "방문하기 →" },
    ctaOutline: false,
  },
  {
    name: "Debate Platform\nfor Class",
    accentBg: "#1E2A44",
    accentText: "#FFFFFF",
    type: "B2B",
    status: { en: "○ In development", kr: "○ 개발 중" },
    tagline: {
      en: "Where students learn by speaking,\nnot by being told.",
      kr: "강요가 아닌, 발언으로 배우는 교실.",
    },
    features: {
      en: ["AI debate prompts", "Turn-based flow", "SEL-integrated"],
      kr: ["AI 토론 주제", "턴 기반 진행", "SEL 통합"],
    },
    cta: { en: "Preview →", kr: "미리 보기 →" },
    ctaOutline: true,
  },
];

export default function BrandPage() {
  const [isKorean, setIsKorean] = useState(false);

  return (
    <div className="min-h-screen bg-[#FFFDFD]">
      <Nav isKorean={isKorean} onToggleLang={() => setIsKorean((v) => !v)} />

      <main className="max-w-[1440px] mx-auto px-5 md:px-10 lg:px-15 pt-[76px]">
        <div className="py-16 lg:py-24">
          <p className="text-[#FF0051] text-[11px] font-medium tracking-[1.5px] uppercase mb-5">
            {isKorean ? "브랜드 & 제품" : "Brand & Products"}
          </p>
          <h1 className="text-[clamp(32px,5vw,56px)] font-normal leading-[1.15] text-[#211C19] mb-12">
            {isKorean ? "지금까지 만든 것." : "What we've built so far."}
          </h1>

          <div className="flex flex-col gap-5">
            {products.map((p) => (
              <div
                key={p.name}
                className="border border-[#EDE5DB] rounded-sm overflow-hidden hover:border-[#D9CFC2] hover:shadow-md transition-all duration-200 lg:flex lg:h-48"
              >
                {/* 액센트 패널 */}
                <div
                  className="p-6 lg:w-56 flex flex-col justify-center"
                  style={{ backgroundColor: p.accentBg }}
                >
                  <p
                    className="text-lg lg:text-xl font-bold whitespace-pre-line"
                    style={{ color: p.accentText }}
                  >
                    {p.name}
                  </p>
                  <span
                    className="mt-2 inline-block px-2 py-1 rounded-full text-[10px] font-semibold w-fit"
                    style={{ backgroundColor: "rgba(0,0,0,0.12)", color: p.accentText }}
                  >
                    {isKorean ? p.status.kr : p.status.en}
                  </span>
                </div>

                {/* 콘텐츠 패널 */}
                <div className="p-6 bg-white flex-1 flex flex-col justify-center">
                  <p className="text-base font-semibold text-[#211C19] leading-snug mb-3 whitespace-pre-line">
                    {isKorean ? p.tagline.kr : p.tagline.en}
                  </p>
                  <div className="flex flex-wrap gap-2">
                    {(isKorean ? p.features.kr : p.features.en).map((f) => (
                      <span
                        key={f}
                        className="px-3 py-1 rounded-full text-[11px] text-[#6B6159] border border-[#EDE5DB]"
                      >
                        {f}
                      </span>
                    ))}
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
