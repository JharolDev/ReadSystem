# Usar una versión más reciente y específica de Node
FROM node:20-slim

# Crear un usuario no root
RUN addgroup --system appgroup && adduser --system appuser --group appgroup

# Establecer directorio de trabajo
WORKDIR /app

# Copiar solo los archivos necesarios
COPY package*.json ./

# Instalar dependencias con versión específica y como usuario no root
USER appuser
RUN npm ci

# Copiar el resto de la aplicación
COPY --chown=appuser:appgroup . .

# Definir comando de inicio
CMD ["node", "index.js"]
