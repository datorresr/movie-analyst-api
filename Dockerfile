# Utiliza una imagen base de Node.js
FROM node:18

# Establece el directorio de trabajo en la imagen
WORKDIR /app

# Copia los archivos de tu aplicación al directorio de trabajo en la imagen
COPY package.json package-lock.json seeds.js /app/
COPY server.js /app/
COPY data_model /app/data_model
COPY script /app/script
COPY test /app/test

# Instala las dependencias de tu aplicación
RUN npm install

# Expone el puerto en el que se ejecutará tu aplicación
EXPOSE 3000

# Comando para iniciar tu aplicación
CMD ["node", "server.js"]