# base image required to run node j app
FROM node:10.13-alpine
# Set Node env variable
ENV NODE_ENV production
#set current working directory of image
WORKDIR /usr/src/app
#copy your local host file to image
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
#install npm into conatiner
RUN npm install --production --silent
#copy all files from host to image first . is our current project directory and second . is image directory
COPY . .

#expose port number to listen image
EXPOSE 8000

#run node jsu command
CMD node index.js