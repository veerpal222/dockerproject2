FROM node:12.2.0-alpine
RUN mkdir /app
ADD . /app
WORKDIR /app
EXPOSE 300
CMD ["node","main.js"]
