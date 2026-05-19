"use client";
import { useState } from "react";
import Nav from "@/components/Nav";

const contacts = [
  {
    role: { en: "For Investors", kr: "투자 문의" },
    email: "invest@cammup.com",
    desc: { en: "Funding rounds, due diligence, strategic partnerships", kr: "투자 라운드, 실사, 전략적 파트너십" },
  },
  {
    role: { en: "For Schools & Partners", kr: "학교·파트너 문의" },
    email: "partners@cammup.com",
    desc: { en: "Pilots, classroom deployment, SEL collaboration", kr: "파일럿, 교실 도입, SEL 협력" },
  },
  {
    role: { en: "For Press", kr: "미디어 문의" },
    email: "press@cammup.com",
    desc: { en: "Interviews, press materials, brand assets", kr: "인터뷰, 보도 자료, 브랜드 에셋" },
  },
];

export default function ContactPage() {
  const [isKorean, setIsKorean] = useState(false);

  return (
    <div className="min-h-screen bg-[#FFFDFD]">
      <Nav isKorean={isKorean} onToggleLang={() => setIsKorean((v) => !v)} />

      <main className="max-w-[1440px] mx-auto px-5 md:px-10 lg:px-15 pt-[76px]">
        <div className="py-16 lg:py-24">
          <div className="lg:flex lg:gap-20">
            {/* 왼쪽 */}
            <div className="lg:flex-1 mb-12 lg:mb-0">
              <p className="text-[#FF0051] text-[11px] font-medium tracking-[1.5px] uppercase mb-5">
                Contact
              </p>
              <h1 className="text-[clamp(32px,4vw,48px)] font-normal leading-[1.15] text-[#211C19] mb-4 whitespace-pre-line">
                {isKorean ? "다음 대화를\n함께 만듭니다." : "Let's build the\nnext conversation."}
              </h1>
              <p className="text-[#6B6159] text-sm leading-relaxed max-w-[420px]">
                {isKorean
                  ? "투자자, 학교, 그리고 사람들의 소통 방식을 함께 설계할 파트너를 만나고 있습니다."
                  : "We're talking with investors, schools, and partners who want to design the future of how people communicate."}
              </p>
            </div>

            {/* 오른쪽 */}
            <div className="lg:flex-1 flex flex-col gap-3">
              {contacts.map((c) => (
                <ContactCard key={c.email} data={c} isKorean={isKorean} />
              ))}
            </div>
          </div>
        </div>
      </main>
    </div>
  );
}

function ContactCard({
  data,
  isKorean,
}: {
  data: (typeof contacts)[0];
  isKorean: boolean;
}) {
  const [hovered, setHovered] = useState(false);
  const [copied, setCopied] = useState(false);

  const handleCopy = async () => {
    await navigator.clipboard.writeText(data.email);
    setCopied(true);
    setTimeout(() => setCopied(false), 2000);
  };

  return (
    <div
      onMouseEnter={() => setHovered(true)}
      onMouseLeave={() => setHovered(false)}
      className={`flex items-center justify-between p-5 bg-white border rounded-sm transition-all duration-200 ${
        hovered ? "border-[#D9CFC2] shadow-sm" : "border-[#EDE5DB]"
      }`}
    >
      <div>
        <p className="text-sm font-bold text-[#211C19] mb-1">
          {isKorean ? data.role.kr : data.role.en}
        </p>
        <p className="text-sm text-[#FF0051] mb-1">{data.email}</p>
        <p className="text-xs text-[#9A8E83]">
          {isKorean ? data.desc.kr : data.desc.en}
        </p>
      </div>

      <button
        onClick={handleCopy}
        className={`flex-shrink-0 ml-4 px-3 py-1.5 rounded-full text-[11px] border border-[#EDE5DB] transition-all duration-150 cursor-pointer ${
          hovered ? "opacity-100" : "opacity-0"
        } ${copied ? "text-[#FF0051]" : "text-[#6B6159]"}`}
      >
        {copied
          ? isKorean ? "✓ 복사됨" : "✓ Copied"
          : isKorean ? "이메일 복사" : "Copy email"}
      </button>
    </div>
  );
}
