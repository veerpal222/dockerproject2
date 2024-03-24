FROM node:12.2.0-alpine
RUN mkdir /app
ADD . /app
WORKDIR /app
EXPOSE 3000
CMD ["node","main.js"]
