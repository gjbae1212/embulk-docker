FROM openjdk:8-alpine

WORKDIR /root

RUN apk update

RUN apk add curl bash libc6-compat gettext

# Required java8(embulk of v0.9 series)
ENV EMBULK_VERSION 0.10.5

RUN curl --create-dirs -o ~/.embulk/bin/embulk -L "https://github.com/embulk/embulk/releases/download/v$EMBULK_VERSION/embulk-$EMBULK_VERSION.jar"

RUN chmod +x ~/.embulk/bin/embulk

RUN echo 'export PATH="/root/.embulk/bin:$PATH"' >> ~/.bashrc

RUN source ~/.bashrc

COPY entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]
