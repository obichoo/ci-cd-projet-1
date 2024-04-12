# Utiliser une image de base légère
FROM node:14-alpine

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers de package.json et package-lock.json
COPY package*.json ./

# Installer les dépendances
RUN npm install

# Copier tous les autres fichiers nécessaires du répertoire courant dans le conteneur
COPY . .

# Exposer le port sur lequel l'application sera accessible
# Render assigne le port via la variable d'environnement $PORT
EXPOSE $PORT

# Définir la commande pour démarrer l'application
CMD ["npm", "start"]
