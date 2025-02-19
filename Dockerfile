FROM node:20-slim

# Crear usuario no root con la sintaxis correcta de Debian
RUN groupadd -r appgroup && useradd -r -g appgroup appuser

WORKDIR /app

COPY package*.json ./

# Cambiar la propiedad de los archivos y usar npm ci
RUN chown -R appuser:appgroup /app
USER appuser
RUN npm ci

COPY --chown=appuser:appgroup . .

CMD ["node", "index.js"]
