FROM golang:1.23 AS builder

WORKDIR /app

COPY . .

RUN go mod init ricardovicente/fullcycle && \
    go mod tidy && \
    go build -o main .

# imagem mais enxuta
FROM scratch

WORKDIR /app

COPY --from=builder /app/main .

CMD ["./main"]