FROM node:alpine

WORKDIR /app

COPY package.json .

RUN apk add --no-cache build-base g++ cairo-dev jpeg-dev pango-dev giflib-dev librsvg-dev && \
    apk add --update --repository http://dl-3.alpinelinux.org/alpine/edge/testing libmount fontconfig && \
    yarn

COPY . .

RUN cp config.example.json config.json && \
    yarn build

CMD ["node", "/app/dist"]
