FROM node:lts-alpine
LABEL maintainer="Anuj Parajuli <anuj.parajuli01@gmail.com>"

# UPDATE SYSTEM
RUN apk update

# CREATE WORKING DIRECTORY
RUN mkdir -p /usr/app

# SET WORKING DIR
WORKDIR /usr/app

## MOUNT NECESSARY PACKAGE FILE
COPY package*.json /usr/app/

## MOUNT ALL NECESSARY FILES
COPY . /usr/app

# Chown all the files to the app user.
RUN chown -R 1000:1000 /usr/app

# Switch to 'nodeUser'
USER 1000

# INSTALL PRE-REQUISITES
RUN npm install

EXPOSE 3000

CMD ["npm", "run", "dev"]