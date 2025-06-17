# Base Python image
FROM python:3.11-slim

# Éviter les prompts interactifs
ENV DEBIAN_FRONTEND=noninteractive

# Installer dépendances système, y compris vi
RUN apt-get update && apt-get install -y \
    git \
    curl \
    bash \
    vim-tiny \
    && rm -rf /var/lib/apt/lists/*

# Créer un utilisateur non-root
RUN useradd -ms /bin/bash sqlmesh
USER sqlmesh
WORKDIR /home/sqlmesh

# Ajouter le PATH local pip
ENV PATH="/home/sqlmesh/.local/bin:$PATH"

# Installer SQLMesh avec le support bigquery 
RUN pip install --no-cache-dir "sqlmesh[bigquery]"

# Préparer le répertoire d'atelier
RUN mkdir -p sqlmesh-atelier-wyseday/jsonkey

WORKDIR /home/sqlmesh/sqlmesh-atelier-wyseday

# Initialiser un projet SQLMesh (BigQuery en exemple)
RUN sqlmesh init bigquery

# Cloner le dépôt de l'atelier
RUN git clone https://github.com/WeWyse/atelier-sqlmesh.git

# Copier le fichier de configuration pour l'exercice
RUN cp /home/sqlmesh/sqlmesh-atelier-wyseday/atelier-sqlmesh/exercice1/config.yaml /home/sqlmesh/sqlmesh-atelier-wyseday/config.yaml

# Exécuter le script de préparation
RUN chmod +x ./atelier-sqlmesh/majScript.sh \
    && ./atelier-sqlmesh/majScript.sh prepa

# Installer SQLMesh avec le support web
RUN pip install --no-cache-dir "sqlmesh[web]"

# Exposer le port pour SQLMesh UI (désormais 8000)
EXPOSE 8000

# Lancer un shell interactif par défaut
CMD ["bash"]

