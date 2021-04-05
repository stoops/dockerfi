FROM debian:latest
COPY . /app
RUN /app/unifi.sh
CMD /app/run.sh
