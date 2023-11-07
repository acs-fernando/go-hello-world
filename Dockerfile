FROM golang:latest as builder

WORKDIR /go/src

# Copy the local source code to the container
COPY main.go .

# Build the Go application
RUN go mod init acassiofs/fullcycle
RUN go build -o hello-world .

FROM ubuntu
WORKDIR /
COPY --from=builder /go/src /hello-go

CMD ["/"]