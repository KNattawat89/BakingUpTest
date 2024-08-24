# Stage 1: Build the Go application
FROM golang:1.21.6 AS builder

WORKDIR /go/src/app
COPY . .

RUN go build -o app cmd/http/main.go