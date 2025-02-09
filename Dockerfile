FROM ubuntu:latest

# Installer les dépendances et télécharger Godot
RUN apt update && apt install -y wget unzip && \
    wget https://downloads.tuxfamily.org/godotengine/4.0/Godot_v4.0-stable_linux_headless.64.zip && \
    unzip Godot_v4.0-stable_linux_headless.64.zip && \
    chmod +x Godot_v4.0-stable_linux_headless.64

# Copier le script Godot
COPY server.gd /app/server.gd
WORKDIR /app

# Exécuter le serveur
CMD ["../Godot_v4.0-stable_linux_headless.64", "--script", "server.gd"]
