# Backend build stage
FROM node:18 AS backend
WORKDIR /backend
COPY PersonalBlogBackend/package*.json ./
RUN npm install
COPY PersonalBlogBackend ./
RUN npm run build

# Frontend build stage
FROM node:18 AS frontend
WORKDIR /frontend
COPY PersonalBlogFrontend/package*.json ./
RUN npm install
COPY PersonalBlogFrontend ./
RUN npm run build

# Final stage with both Nginx and Node
FROM node:18-slim

# Install Nginx
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# Copy Nginx config
COPY render.nginx.conf /etc/nginx/nginx.conf

# Copy built frontend static files
COPY --from=frontend /frontend/dist /usr/share/nginx/html

# Copy built backend code and dependencies
COPY --from=backend /backend/dist /app
COPY --from=backend /backend/node_modules /app/node_modules
COPY --from=backend /backend/package.json /app/package.json

# Copy the start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /app
EXPOSE 80
CMD ["/start.sh"]

# build the container using the command below
# docker build -t personal-blog:latest .
# run the container using the command below
# docker run -d -p 80:80 personal-blog:latest
