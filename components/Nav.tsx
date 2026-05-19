"use client";

import Link from "next/link";
import Image from "next/image";
import { usePathname } from "next/navigation";
import { useState } from "react";

interface NavProps {
  isKorean: boolean;
  onToggleLang: () => void;
}

export default function Nav({ isKorean, onToggleLang }: NavProps) {
  const pathname = usePathname();
  const isHome = pathname === "/";

  const links = [
    { label: isKorean ? "회사" : "Company", href: "/company" },
    { label: isKorean ? "비전" : "Vision",  href: "/vision"  },
    { label: isKorean ? "브랜드" : "Brand", href: "/brand"   },
    { label: isKorean ? "문의" : "Contact", href: "/contact" },
  ];

  return (
    <header className="fixed top-0 left-0 right-0 z-50 backdrop-blur-md bg-[#FFFDFD]/80 border-b border-[#EDE5DB]">
      <div className="max-w-[1440px] mx-auto px-5 md:px-10 lg:px-15 h-[76px] flex items-center gap-6">
        {/* 로고 */}
        <Link href="/" className="flex-shrink-0">
          <Image src="/logo.svg" alt="CAMMUPLABS" width={100} height={20} priority />
        </Link>

        {/* 데스크탑 메뉴 */}
        <nav className="hidden lg:flex items-center gap-8 mx-auto">
          {links.map((l) => (
            <NavLink key={l.href} href={l.href} label={l.label} active={pathname === l.href} />
          ))}
        </nav>

        <div className="flex items-center gap-2 ml-auto">
          {/* ← Home 버튼 (홈 제외) */}
          {!isHome && (
            <Link
              href="/"
              className="hidden md:inline-flex items-center px-3 py-2 text-xs font-medium text-[#211C19] border border-[#EDE5DB] rounded-full hover:border-[#211C19] transition-colors"
            >
              ← {isKorean ? "홈" : "Home"}
            </Link>
          )}

          {/* 언어 토글 */}
          <button
            onClick={onToggleLang}
            className="text-xs font-medium cursor-pointer hover:opacity-60 transition-opacity"
          >
            <span className={isKorean ? "text-[#9A8E83]" : "font-bold text-[#211C19]"}>EN</span>
            <span className="text-[#9A8E83]"> / </span>
            <span className={isKorean ? "font-bold text-[#211C19]" : "text-[#9A8E83]"}>KR</span>
          </button>
        </div>
      </div>
    </header>
  );
}

function NavLink({ href, label, active }: { href: string; label: string; active: boolean }) {
  const [hovered, setHovered] = useState(false);
  return (
    <Link
      href={href}
      onMouseEnter={() => setHovered(true)}
      onMouseLeave={() => setHovered(false)}
      className={`text-sm pb-1 border-b-2 transition-colors ${
        active || hovered
          ? "border-[#211C19] font-semibold"
          : "border-transparent font-medium"
      } text-[#211C19]`}
    >
      {label}
    </Link>
  );
}
