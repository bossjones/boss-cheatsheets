FROM python:3.6.3-alpine3.6

# RUN pip install cheat

# COPY . /usr/local/lib/python3.5/site-packages/cheat/cheatsheets

# RUN apk --update add --virtual build-dependencies libffi-dev openssl-dev build-base && \
#     apk add --no-cache --virtual .deps \
#     ca-certificates \
#     libressl \
#     libressl-dev \
#     git \
#     g++ \
#     make \
#     musl-dev \
#     zlib-dev \
#     bash \
#     && \
#     pip install --no-cache-dir cheat

RUN apk --update add --virtual build-dependencies libffi-dev openssl-dev build-base && \
    apk add --no-cache --virtual .deps \
    ca-certificates \
    git \
    g++ \
    make \
    musl-dev \
    zlib-dev \
    bash \
    && \
    pip install --no-cache-dir cheat

ENV PATH /usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV LANG en_US.UTF-8
ENV PYTHONUNBUFFERED 1
ENV CHEATCOLORS true
ENV TERM xterm

COPY . /root/.cheat

ENTRYPOINT [ "/usr/local/bin/cheat" ]
CMD ["@"]
