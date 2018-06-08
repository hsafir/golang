FROM golang:latest
RUN mkdir -p /go/src/github.com/golang
ADD . /go/src/github.com/golang
WORKDIR /go/src/github.com/golang
ENV GOPATH="/go"
RUN ls /go/src/github.com/golang && \
    export GOPATH && \
    go env && \
    go get -u github.com/gorilla/mux && \
    go get && \
    go build 
EXPOSE 8084 
CMD ["main.go"]
