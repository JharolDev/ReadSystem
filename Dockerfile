# Utilizamos una imagen base para efectos de prueba
FROM alpine:3.15

# Instalamos Trivy para simular el escaneo
RUN apk add --no-cache curl
RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin

# Copiamos el contenido de la carpeta actual al contenedor
COPY . .

# Ejecutamos Trivy para escanear el contenido
CMD ["trivy", "image", "--severity", "HIGH,MEDIUM,LOW", "--ignore-unfixed", "--format", "json", "--output", "docker-image-vul.json"]
