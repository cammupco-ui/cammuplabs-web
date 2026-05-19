import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  output: "export",       // GitHub Pages 정적 배포
  trailingSlash: true,    // /company → /company/index.html
  images: {
    unoptimized: true,    // static export에서 next/image 사용
  },
};

export default nextConfig;
