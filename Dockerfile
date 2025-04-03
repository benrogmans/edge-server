FROM ghcr.io/gleam-lang/gleam:v1.9.1-erlang-alpine

# Add project code
COPY . /build/

# Compile the Gleam application
RUN apk add gcc build-base \
  && cd /build \
  && gleam export erlang-shipment \
  && mv build/erlang-shipment /app \
  && rm -r /build \
  && apk del gcc build-base \
  && addgroup -S edge-server \
  && adduser -S edge-server -G edge-server \
  && chown -R edge-server /app

# Run the application
USER edge-server
WORKDIR /app
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["run"]