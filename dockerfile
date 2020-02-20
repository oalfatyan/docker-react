#first container
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#second container
FROM nginx
#copy /app/build folder from the first phase to nginx folder  
COPY --from=builder /app/build /usr/share/nginx/html
