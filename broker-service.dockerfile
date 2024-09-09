# base go image
FROM golang:1.22.7-alpine as builder

RUN mkdir /app

COPY . /app

WORKDIR /app

# build the application binary
RUN CGO_ENABLED=0 go build -o brokerApp ./cmd/api

# give execute permissions to the binary
RUN chmod +x brokerApp

# build a tiny docker image
FROM alpine:latest

RUN mkdir /app

# copy the binary from the build stage
COPY --from=builder /app/brokerApp /app

# run the binary when the container starts
CMD [ "/app/brokerApp" ]