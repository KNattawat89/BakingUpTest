# Stage 1: Build the Go application
FROM golang:1.21.6 AS builder

WORKDIR /go/src/app
COPY . .

RUN go build -o app main.go

# Stage 2: Run the application
FROM debian:bullseye-slim

WORKDIR /app
COPY --from=builder /go/src/app/app /app

CMD ["./app"]