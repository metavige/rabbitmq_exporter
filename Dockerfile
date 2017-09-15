FROM quay.io/prometheus/golang-builder as builder

ADD .   /go/src/github.com/kbudde/rabbitmq_exporter
WORKDIR /go/src/github.com/kbudde/rabbitmq_exporter

RUN make

FROM scratch

COPY --from=builder /go/src/github.com/kbudde/rabbitmq_exporter/rabbitmq_exporter  /rabbitmq_exporter

EXPOSE      9090

CMD ["/rabbitmq_exporter"]
