from golang:1.21.0-bullseye AS builder

WORKDIR /go/src

COPY go.mod /go/src/go.mod
COPY main.go /go/src/

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /main .

FROM scratch

COPY --from=builder /main .

CMD [ "./main" ]
