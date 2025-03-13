FROM golang:alpine AS builder

WORKDIR /app

RUN go mod init fc-rocks-go-docker

COPY main.go .

RUN go build -ldflags="-s -w" -o fc-rocks-go-docker

FROM scratch

COPY --from=builder /app/fc-rocks-go-docker /fc-rocks-go-docker

ENTRYPOINT ["/fc-rocks-go-docker"]
