#DOCKER Spec
FROM node:14alpine
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY ./frontend/*.json /
RUN npm install 
COPY ./frontend /app/frontend
EXPOSE 3000
CMD ["npm", "start"]
