#DOCKER Spec
FROM node:14-alpine
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY ./frontend/*.json ./
RUN npm install 
COPY ./frontend/* .
EXPOSE 3000
CMD ["npm", "start"]
