"use client";
import { useState } from "react";
import Nav from "@/components/Nav";

export default function CompanyPage() {
  const [isKorean, setIsKorean] = useState(false);

  return (
    <div className="min-h-screen bg-[#FFFDFD]">
      <Nav isKorean={isKorean} onToggleLang={() => setIsKorean((v) => !v)} />

      <main className="max-w-[1440px] mx-auto px-5 md:px-10 lg:px-15 pt-[76px]">
        <div className="py-16 lg:py-24">
          {/* 태그 */}
          <p className="text-[#FF0051] text-[11px] font-medium tracking-[1.5px] uppercase mb-5">
            Company
          </p>

          {/* 헤드라인 */}
          <h1 className="text-[clamp(32px,5vw,56px)] font-normal leading-[1.15] text-[#211C19] mb-6 whitespace-pre-line">
            {isKorean ? "CAMMUPLABS는\n질문을 연구합니다." : "CAMMUPLABS\nresearches questions."}
          </h1>

          {/* 설명 */}
          <p className="text-[#6B6159] text-sm md:text-base leading-relaxed max-w-[640px] mb-14">
            {isKorean
              ? "CAMMUP은 'Come Up with idea'에서 이미 그 아이디어가 실현되었다는 의미를 담고 있습니다. 새로운 아이디어는 질문을 만들고, 그 질문이 떠오르는 순간, 그것은 이미 시작된 가능성입니다."
              : "CAMMUP means 'Come Up' — where the idea has already arrived. New ideas birth questions, and the moment a question surfaces, it is already a possibility in motion."}
          </p>

          <hr className="border-[#EDE5DB] mb-12" />

          {/* Mission / Vision */}
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-10">
            <InfoBlock
              label={isKorean ? "미션" : "MISSION"}
              title={isKorean ? "사람들의 진정한 소통을 돕는다." : "Help people communicate with genuine depth."}
              body={
                isKorean
                  ? "단절된 대화를 잇고, 서로의 진심을 확인하는 기술을 만듭니다."
                  : "We build technology that reconnects conversations and lets sincerity travel between people."
              }
            />
            <InfoBlock
              label={isKorean ? "비전" : "VISION"}
              title={isKorean ? "질문이 기술이 되는 세상." : "A world where questions are technology."}
              body={
                isKorean
                  ? "사람들이 서로를 궁금해하고, 기분 좋게 대화할 수 있는 세상을 만듭니다."
                  : "A world where people are curious about each other, and conversation feels effortless and real."
              }
            />
          </div>
        </div>
      </main>
    </div>
  );
}

function InfoBlock({ label, title, body }: { label: string; title: string; body: string }) {
  return (
    <div>
      <p className="text-[#FF0051] text-[10px] font-medium tracking-[1.5px] uppercase mb-3">{label}</p>
      <h2 className="text-xl font-semibold text-[#211C19] leading-snug mb-2">{title}</h2>
      <p className="text-[#6B6159] text-sm leading-relaxed">{body}</p>
    </div>
  );
}
