# Build stage
FROM golang:1.20-alpine AS builder

WORKDIR /app

COPY . .

RUN go build -o api .

# Final stage
FROM scratch

WORKDIR /app

COPY --from=builder /app/api .

EXPOSE 8000

CMD ["./api"]

