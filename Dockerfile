FROM golang:latest
USER root
RUN mkdir /app
ADD . /app/
WORKDIR /app
RUN ls /app
RUN go get -u github.com/gorilla/mux
RUN go build
EXPOSE 8084
USER root
CMD ["go","run","/app/main.go"]
