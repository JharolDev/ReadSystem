FROM alpine:3.18

## Crear usuario no root
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

# Copiar los archivos del proyecto
COPY --chown=appuser:appgroup . .

USER appuser

# Comando por defecto (ajústalo según tu script principal)
CMD ["/bin/sh"]
