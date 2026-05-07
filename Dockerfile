# =========================
# Stage 1 → Build Stage
# =========================
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy dependency files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy application source code
COPY . .

# Build application
RUN npm run build


# =========================
# Stage 2 → Production Stage
# =========================
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy only required files from builder stage
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/node_modules ./node_modules

# Expose application port
EXPOSE 3000

# Start application
CMD ["npm", "start"]
