import type { Metadata } from "next";
import { Alexandria } from "next/font/google";
import "./globals.css";

const alexandria = Alexandria({
  subsets: ["latin"],
  weight: ["400", "500", "600", "700"],
  variable: "--font-alexandria",
  display: "swap",
});

export const metadata: Metadata = {
  title: "CAMMUPLABS — A technology for meaningful conversation.",
  description:
    "CAMMUPLABS researches questions. We build technology that reconnects conversations and lets sincerity travel between people.",
  openGraph: {
    title: "CAMMUPLABS",
    description: "A technology for meaningful conversation.",
    url: "https://cammuplabs.com",
    siteName: "CAMMUPLABS",
    locale: "ko_KR",
    type: "website",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="ko" className={`${alexandria.variable} h-full`}>
      <body className="min-h-full bg-[#FFFDFD] font-[family-name:var(--font-alexandria)]">
        {children}
      </body>
    </html>
  );
}
