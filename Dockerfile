FROM ubuntu:latest

# Installer les dépendances nécessaires
RUN apt update && apt install -y wget unzip

# Télécharger Godot (version 4 stable)
RUN wget https://downloads.tuxfamily.org/godotengine/4.0/Godot_v4.0-stable_linux_headless.64.zip
RUN unzip Godot_v4.0-stable_linux_headless.64.zip
RUN chmod +x Godot_v4.0-stable_linux_headless.64

# Copier le fichier server.gd dans le container
COPY server.gd /app/server.gd
WORKDIR /app

# Exécuter le serveur Godot
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh
CMD ["/app/start.sh"]

#CMD ["./Godot_v4.0-stable_linux_headless.64", "--script", "server.gd"]
