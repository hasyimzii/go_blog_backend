FROM golang:1.21.3-alpine AS builder

WORKDIR /app
COPY . .
RUN go build -o bin .

FROM alpine:3

WORKDIR /app
COPY --from=builder /app/.env .
COPY --from=builder /app/bin .

EXPOSE ${APP_PORT}

ENTRYPOINT [ "./bin" ]