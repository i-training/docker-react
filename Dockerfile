FROM node:alpine as buildPhase
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build


FROM nginx as runPhase
EXPOSE 80
COPY --from=buildPhase /app/build /usr/share/nginx/html
#nginx server doesnt need a startup command
# the image already has a run command
