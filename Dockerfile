FROM node:14-alpine AS builder
#ENV NODE_ENV production
# dd a work directory
#RUN apk update && apk upgrade && \
   # apk add --no-cache git 
#WORKDIR /app
# Cache and Install dependencies
#COPY package.json .
#RUN npm install --production && npm cache clean --force
# Copy app files
#COPY . .
# Build the app

RUN apk update && apk upgrade && \
    apk add --no-cache git 
RUN mkdir -p /app
WORKDIR /app
COPY ./package.json /app
RUN npm install --production && npm cache clean --force
COPY ./ /app

EXPOSE 3000

CMD [ "npm", "run" , "docker-start" ]


