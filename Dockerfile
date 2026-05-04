FROM node:20-slim

RUN corepack enable
ENV HUSKY=0

WORKDIR /app

# 🔥 copy semua file dulu (biar .env.example ikut)
COPY . .

# baru install
RUN pnpm install --frozen-lockfile

RUN pnpm build

CMD ["pnpm", "start"]