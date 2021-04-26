FROM node:10-alpine
WORKDIR /app
COPY package.json .
RUN yarn install
COPY . .
###########################
#Deploy
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html/
WORKDIR /usr/share/nginx/html/snapshot
RUN mv ../static .
EXPOSE 80
