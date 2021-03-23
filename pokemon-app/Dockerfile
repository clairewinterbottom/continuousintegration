# Put this in ~/dev/academy/neil-jennings-academy-content/javascript-api-express/examples/
# Rename to 'Dockerfile' ofc.
# Then build this with "docker build --tag my-simple-express-app ."
# Then run with "docker run --name marks-app -p 5100:5100 -d my-simple-express-app:latest"

FROM alpine:latest

RUN apk add --update nodejs nodejs-npm

RUN mkdir /app
COPY * /app/
RUN cd /app && npm install

EXPOSE 3000

ENTRYPOINT ["node", "/app/server.js"]
