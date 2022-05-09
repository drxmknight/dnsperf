FROM alpine:latest
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && apk update
RUN apk add libressl-dev ldns-dev nghttp2-dev automake git g++ libtool autoconf ck-dev make 
RUN cd /tmp && git clone https://github.com/DNS-OARC/dnsperf.git 
WORKDIR /tmp/dnsperf
RUN ./autogen.sh
RUN ./configure
RUN make && make install
ENTRYPOINT ["dnsperf"]
