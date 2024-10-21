FROM node:latest

WORKDIR /app

COPY package*.json ./
# Man sollte lieber so kopieren, Vorteil ist, 
# Docker spart Zeit, indem er den npm install 
# Schritt nur wiederholt, wenn sich die Abhängigkeiten 
# (in der package.json) ändern. 
# Das vermeidet unnötige Neuinstallationen, 
# wenn sich nur der Code ändert, 
# und nutzt das Cache-System effizient.

RUN npm install

COPY . .

RUN npm run build

RUN npm install -g serve

EXPOSE 3000

CMD ["npm","start"]