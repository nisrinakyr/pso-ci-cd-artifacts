FROM node:20-slim

# aktifkan pnpm
RUN corepack enable

# hindari error husky di CI
ENV HUSKY=0

WORKDIR /app

# copy dependency dulu (biar cache optimal)
COPY package.json pnpm-lock.yaml ./

RUN pnpm install --frozen-lockfile

# copy semua source
COPY . .

RUN pnpm build

CMD ["pnpm", "start"]