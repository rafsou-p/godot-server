FROM ubuntu:latest

# Installer les dépendances
RUN apt update && apt install -y wget unzip

# Télécharger Godot (version headless)
RUN wget https://downloads.tuxfamily.org/godotengine/4.0/Godot_v4.0-stable_linux_headless.64.zip
RUN unzip Godot_v4.0-stable_linux_headless.64.zip
RUN chmod +x Godot_v4.0-stable_linux_headless.64

# Copier le script du serveur
COPY server.gd /app/server.gd
WORKDIR /app

# Exécuter le serveur
CMD ["../Godot_v4.0-stable_linux_headless.64", "--script", "server.gd"]
