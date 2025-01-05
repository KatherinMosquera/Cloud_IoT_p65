
#Usar la imagen oficial 
FROM node:20.18.0

#RUN apt-get update && apt-get install -y python3 make g++ && rm -rf /var/lib/apt/lists/*

#Crear directorio de trabajo 
WORKDIR /home/node/app

#Copiar archivos necesarios 
COPY mycode/package*.json ./
COPY mycode/tsconfig.json ./ 

#Instalar las dependencias 
#WORKDIR /home/node/app
RUN npm install --force 

#Copia el codigo compilado desde la carpeta dist/
COPY mycode/dist ./dist

#Expone el puerto 
EXPOSE 3000

#Comando para iniciar la aplicacion
CMD [ "node", "dist/index.js" ]
