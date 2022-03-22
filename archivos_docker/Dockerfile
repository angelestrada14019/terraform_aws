FROM node:14
#imagen de node 14

#COPY [".", "/usr/src/"]
#copia todos los archivos de esta ruta a la carpeta /usr/src/
# la ruta (.) es donde estoy parados y la carpeta /usr/src/ es donde se va a copiar

COPY ["package.json", "/usr/src/"]

WORKDIR /usr/src
#cambia el directorio de trabajo a /usr/src es como un cd

RUN npm install
#ejecuta npm install para instalar las dependencias

COPY [".", "/usr/src/"]

EXPOSE 3000
#expone el puerto 3000 para que el servidor escuche en ese puerto
#permite que el pueerto sea vinculable a un puerto en el host

CMD ["npm", "start"]
#ejecuta el comando node
