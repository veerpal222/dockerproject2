FROM node:12.2.0-alpine
RUN mkdir /app1
ADD . /app1
WORKDIR /app1
EXPOSE 3000
CMD ["node","main.js"]
