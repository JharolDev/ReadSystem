FROM node:14
RUN npm install request@2.88.2
WORKDIR /app
COPY . .
RUN npm install
CMD ["node", "index.js"]
