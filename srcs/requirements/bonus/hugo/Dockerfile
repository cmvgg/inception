FROM    alpine:3.15

WORKDIR /var/hugo/me

RUN     apk update && apk upgrade && apk add --update --no-cache \
            hugo \
            git \
            shadow \
 &&     rm -f /var/cache/apk/*

RUN hugo new site /var/hugo/me \
 	&&     cd /var/hugo/me \
 	&&     git clone https://github.com/vaga/hugo-theme-m10c themes/m10c \
 	&&     hugo -b https://cvarela-.42.fr/me

COPY    ./conf/config.toml        /var/hugo/me/config.toml
COPY    conf/Compose.jpeg         /var/hugo/me/themes/m10c/static/Compose.jpeg

EXPOSE 1313

CMD     ["hugo", "server", \
         "--bind=0.0.0.0", \
         "--baseURL=https://cvarela-.42.fr/me", \
         "-p", "1313", \
         "--logFile=/dev/stdout", \
        "--appendPort=false"]