# ==========================================
# Stage 1: Build Stage
# ==========================================
FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY main.go .
# Compile a statically linked binary without debug symbols for minimum size
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o server main.go

# ==========================================
# Stage 2: Final Lean Runtime Stage
# ==========================================
FROM alpine:3.19
WORKDIR /root/
COPY --from=builder /app/server .
EXPOSE 8080
CMD ["./server"]
