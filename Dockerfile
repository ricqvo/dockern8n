FROM n8nio/n8n:latest

USER root

# Install dependencies required by Chromium
RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    fonts-liberation \
    libnss3 \
    libatk-bridge2.0-0 \
    libxkbcommon0 \
    libgtk-3-0 \
    libasound2 \
    libgbm-dev \
    libxshmfence-dev \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libxfixes3 \
    libxext6 \
    libdrm2 \
    libx11-xcb1 \
    libxcb-dri3-0 \
    libxcursor1 \
    libxi6 \
    libxtst6 \
    libpangocairo-1.0-0 \
    libcups2 \
    libxss1 \
    && rm -rf /var/lib/apt/lists/*

# Install Playwright
RUN npm install playwright
RUN npx playwright install chromium

USER node
