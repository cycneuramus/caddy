FROM caddy:2.7.6-builder AS builder

ENV GOARCH $TARGETARCH

RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddyserver/transform-encoder \
	--with github.com/gamalan/caddy-tlsredis \
	--with github.com/mholt/caddy-l4=github.com/mholt/caddy-l4@c5d815daed3cf7c9be6f199b324aeae8b3c865f0 \
	--with github.com/sagikazarmark/caddy-fs-s3

FROM caddy:2.7.6
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
