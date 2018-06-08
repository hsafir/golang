FROM centos:latest
USER root
RUN yum -y update && \
    yum clean all && \
    yum install -y wget && \
    wget https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz && \
    tar -zxvf go1.8.3.linux-amd64.tar.gz -C /usr/local && \
    echo 'export GOROOT=/usr/local/go' | sudo tee -a /etc/profile && \
    echo 'export PATH=$PATH:/usr/local/go/bin' | sudo tee -a /etc/profile && \
    source /etc/profile && \
    go version && \
    mkdir -p /src/github.com/go
ADD . /src/github.com/go
WORKDIR /src/github.com/go
RUN go get -u github.com/gorilla/mux
RUN go build
EXPOSE 8084
USER root
CMD ["go","run","main.go"]
