# Atelier SQLMesh

Ce dépôt contient les supports et exercices pour l’atelier de découverte et prise en main de **SQLMesh**.  
Vous y trouverez la procédure d’installation, les commandes principales, ainsi que des exercices pratiques pour explorer les fonctionnalités de SQLMesh.

---

## Sommaire

1. [Présentation et principales commandes SQLMesh](#principales-commandes-sqlmesh)
2. [Installation et prérequis](#installation)
3. [Configuration](#configuration)
4. [Lancement des exercices](#lancement-des-exercices)
5. [Analyse et définition des modèles](#analyse-des-fichiers-sources--définitions-des-modèles)
6. [Déploiement (dev/prod)](#déploiement)
7. [Macros, tests, audits et UI](#macros-tests-audits-et-ui)
8. [Autres commandes utiles](#autres-commandes-utiles)

---

## Principales commandes SQLMesh

Pour afficher toutes les commandes disponibles, utilisez :
```bash
sqlmesh --help
```

Parmi les commandes principales :

- `audit` : Exécute les audits pour les modèles cibles.
- `clean` : Nettoie le cache SQLMesh et les artefacts de build.
- `create_external_models` : Génère un fichier de schéma pour les modèles externes.
- `create_test` : Génère un fixture de test unitaire pour un modèle.
- `dag` : Génère le DAG sous forme de fichier HTML.
- `diff` : Compare l’état local avec l’état distant.
- `dlt_refresh` : Gère les pipelines DLT.
- `environments` : Liste les environnements SQLMesh.
- `evaluate` : Évalue un modèle et renvoie un dataframe.
- `fetchdf` : Exécute une requête SQL et affiche les résultats.
- `format` : Formate tous les modèles et audits SQL.
- `info` : Infos sur un projet SQLMesh.
- `init` : Initialise un nouveau dépôt SQLMesh.
- `invalidate` : Invalide un environnement cible.
- `janitor` : Nettoyage à la demande.
- `lint` : Lint des modèles cibles.
- `migrate` : Migration vers la version SQLMesh courante.
- `plan` : Applique les modifications locales à l’environnement cible.
- `prompt` : Génère une requête SQL à partir d’un prompt.
- `render` : Rend la requête d’un modèle.
- `rewrite` : Réécrit une expression SQL.
- `rollback` : Retour à la migration précédente.
- `run` : Évaluation des intervalles manquants.
- `state` : Commandes pour interagir avec l’état.
- `table_diff` : Diff entre deux tables.
- `table_name` : Affiche le nom physique d’une table.
- `test` : Lancement des tests unitaires.
- `ui` : Lance l’interface web de SQLMesh.

---

## Installation

**Prérequis :**  
- Docker  
- git

1. Récupérer la clé json pour accéder à GCP 
2. Cloner le dépôt :
    ```bash
    git clone git@github.com:WeWyse/atelier-sqlmesh.git
    cd atelier-sqlmesh
    ```
3. Construire et lancer le conteneur :
    ```bash
    docker build --no-cache -t sqlmesh-training .
    docker run -di --name sqlmesh-service \
      -v /<local_path_jsonkey>/:/home/sqlmesh/sqlmesh-atelier-wyseday/jsonkey \
      -p 8000:8000 sqlmesh-training
    docker exec -ti sqlmesh-service sh
    ```
    Vous devez être dans `/home/sqlmesh/sqlmesh-atelier-wyseday`.

4. Vérifier l’installation :
    ```bash
    sqlmesh --version
    ```

---

## Configuration

Aucune manipulation manuelle n’est nécessaire : tout est pris en compte dans le Dockerfile.

---

## Lancement des exercices

### Préparation des environnements

```bash
./atelier-sqlmesh/majScript.sh prepa
```

### Exercice 1

```bash
./atelier-sqlmesh/majScript.sh exercice1 dataset_<nickname>
```

---

## Analyse des fichiers sources & définitions des modèles

Consultez les fichiers du dossier `atelier-sqlmesh` pour analyser les sources et définir vos modèles.

---

## Déploiement

### Environnement de développement

```bash
sqlmesh plan dev_<nickname>
```

### Environnement de production

```bash
sqlmesh plan prod_<nickname>
```

Pour visualiser la requête générée :

```bash
sqlmesh render dataset_<nickname>.enriched_orders
```

---

## Macros, tests, audits et UI

### Mise en place de macros

```bash
./atelier-sqlmesh/majScript.sh exercice2 dataset_<nickname>
# Modifiez le fichier macros.sql si besoin
```

Déployer avec la macro :

```bash
sqlmesh plan dev_<nickname>
sqlmesh plan prod_<nickname>
```

---

### Mise en place de tests

```bash
./atelier-sqlmesh/majScript.sh exercice3 dataset_<nickname>
# Modifiez le fichier de tests si besoin
sqlmesh test
```

Pour vérifier le comportement en cas d’erreur, modifiez la macro puis relancez :

```bash
sqlmesh test
```

---

### Mise en place d’audits

```bash
./atelier-sqlmesh/majScript.sh exercice4 dataset_<nickname>
sqlmesh audit
```

Après avoir inséré une erreur, déployez :

```bash
sqlmesh plan dev_<nickname>
```

---

### UI SQLMesh

Pour lancer l’interface web :

```bash
sqlmesh ui
# Dans votre navigateur : http://localhost:8000
```

---

## Autres commandes utiles

- Nettoyer les versions temporaires/obsolètes :  
  ```bash
  sqlmesh janitor
  ```
- Informations sur le projet :  
  ```bash
  sqlmesh info
  ```
- Nettoyer le cache :  
  ```bash
  sqlmesh clean
  ```
- Générer le DAG en HTML :  
  ```bash
  sqlmesh dag <file_model>
  ```

---

## Lien vers le document de présentation du Wyseday
[ici](https://docs.google.com/document/d/1DvMiqrmwdJXZrrnz30hO0lsww-AvdCpwl1iXWBL7dlA/edit?pli=1&tab=t.0)


---

## Ressources

- [Documentation officielle SQLMesh](https://sqlmesh.readthedocs.io/)
- [Support GCP](https://cloud.google.com/)
- [Dépôt GitHub SQLMesh](https://github.com/TobikoData/sqlmesh)

---

*Pour toute question, contactez l’équipe WeWyse ou ouvrez une issue dans ce dépôt.*
