# Build stage
FROM node:14 AS build
WORKDIR /app
COPY index.html .

# Production stage
FROM nginx:alpine
COPY --from=build /app/index.html /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]