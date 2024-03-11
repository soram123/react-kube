
# Set the base image to build from 
FROM node:19.5.0-alpine

# set the working directory
WORKDIR /app

# copy package.json and package-lock.json files
COPY package*.json ./
COPY package-lock*.json ./

# install dependencies
RUN npm install

# copy everything to /app directory
COPY ./ ./ 

# run the app
CMD ["npm", "start"]

FROM nginx:alpine
COPY build/ /usr/share/nginx/html