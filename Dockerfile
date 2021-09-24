# syntax=docker/dockerfile:1

FROM golang:1.16-alpine

# creates and sets the working directory
WORKDIR /app

# copy all dependencies into the working dir
COPY go.mod ./
COPY go.sum ./

# download all dependencies
RUN go mod download

# copy all go files into the working dir
COPY *.go ./

# build executable named docker-gs-ping
RUN go build -o /docker-gs-ping

# call executable
CMD [ "/docker-gs-ping" ]