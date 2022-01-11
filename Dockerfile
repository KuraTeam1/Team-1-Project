FROM node:16

WORKDIR /application

ENV PATH /application/node_modules/.bin:$PATH

COPY ./package.json ./
COPY ./package-lock.json ./
RUN npm install
RUN npm install react-scripts@3.4.1 -g --silent

COPY . ./
EXPOSE 3000

CMD ["npm", "start"]