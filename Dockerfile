# Build backend
FROM node:18 AS backend
WORKDIR /backend
COPY PersonalBlogBackend/package*.json ./
RUN npm install
COPY PersonalBlogBackend ./
RUN npm run build

# Build frontend
FROM node:18 AS frontend
WORKDIR /frontend
COPY PersonalBlogFrontend/package*.json ./
RUN npm install
COPY PersonalBlogFrontend ./
RUN npm run build

# Setup nginx
FROM nginx:alpine
COPY nginx.conf /etc/nginx/nginx.conf

COPY --from=frontend /frontend/dist /usr/share/nginx/html

COPY --from=backend /backend/dist /app
COPY --from=backend /backend/node_modules /app/node_modules
COPY --from=backend /backend/package.json /app/package.json

COPY start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /app
EXPOSE 80

CMD ["/start.sh"]