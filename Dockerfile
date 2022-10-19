FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/porech/caddy-maxmind-geolocation \
    --with github.com/caddyserver/transform-encoder \
    --with github.com/caddy-dns/cloudflare

FROM caddy:latest
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
