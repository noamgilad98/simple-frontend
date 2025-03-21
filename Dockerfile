# Use official Node.js image for build step
FROM node:18 as build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Use nginx to serve the build
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
