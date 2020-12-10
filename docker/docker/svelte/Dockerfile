FROM node

WORKDIR /var/www/urlearn

COPY ./rollup.config.js ./
COPY ./package*.json ./

# RUN npm install

COPY ./src ./src
COPY ./public ./public

# RUN npm run dev
ENTRYPOINT npm install && npm run dev

# RUN npm run-script build

# EXPOSE 5000

# ENV HOST=0.0.0.0

# CMD [ "npm", "start" ]