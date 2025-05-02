FROM node:18-slim

# Install Nginx
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# Copy Nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Copy frontend static files
COPY --from=frontend /frontend/dist /usr/share/nginx/html

# Copy backend files
COPY --from=backend /backend/dist /app
COPY --from=backend /backend/node_modules /app/node_modules
COPY --from=backend /backend/package.json /app/package.json

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /app
EXPOSE 80
CMD ["/start.sh"]
