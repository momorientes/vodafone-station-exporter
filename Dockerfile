FROM golang as builder
ADD . /go/vodafone-station-exporter
WORKDIR /go/vodafone-station-exporter
RUN go build

FROM ubuntu:latest
WORKDIR /app
COPY --from=builder /go/vodafone-station-exporter/vodafone-station-exporter .
CMD ./vodafone-station-exporter -vodafone.station-password=$VF_STATION_PASS -vodafone.station-url=$VF_STATION_URL
EXPOSE 9420
