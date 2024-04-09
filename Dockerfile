FROM caddy:builder AS builder

ENV GOARCH $TARGETARCH

RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddyserver/transform-encoder \
	--with github.com/gamalan/caddy-tlsredis \
	--with github.com/mholt/caddy-l4 \
	--with github.com/sagikazarmark/caddy-fs-s3

FROM caddy:latest
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
