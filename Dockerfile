FROM node:10-alpine
WORKDIR /app
COPY package.json .
RUN npm config set [--global] devdir /tmp/.gyp
RUN npm install
COPY . .
###########################
#Deploy
FROM nginx
COPY --from=0 /app /usr/share/nginx/html/
WORKDIR /usr/share/nginx/html/snapshot
##RUN mv ../static .
EXPOSE 80
