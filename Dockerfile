# Build stage
FROM node:18 AS build
WORKDIR /app
COPY index.html .

# Production stage
FROM nginx:alpine
COPY --from=build /app/index.html /usr/share/nginx/html/
EXPOSE 80
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -f http://localhost/ || exit 1
CMD ["nginx", "-g", "daemon off;"]
