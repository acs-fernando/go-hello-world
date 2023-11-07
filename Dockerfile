FROM golang:latest as builder

WORKDIR /app

COPY go.mod ./
COPY main.go ./

RUN go build -o /hello-world

FROM scratch
WORKDIR /
COPY --from=builder /hello-world /hello-world

ENTRYPOINT ["/hello-world"]