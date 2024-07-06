# Use Node.js 18 Alpine as base image
FROM node:18-alpine

# Install necessary dependencies
RUN apk add --update libc6-compat python3 make g++ build-base cairo-dev pango-dev chromium

# Set environment variables for Puppeteer
ENV PUPPETEER_SKIP_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and yarn.lock to install dependencies
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Copy the entire application source code
COPY . .

# Build the application
RUN yarn build

# Expose port 3000 for the application
EXPOSE 3003

# Command to start the application
CMD ["yarn", "start"]
