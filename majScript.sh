#!/bin/bash

# Vérifier qu'un argument a été passé
if [ -z "$1" ]; then
  echo "Usage: $0 {prepa|exercice1|exercice2|exercice3|exercice4}"
  exit 1
fi

# Récupérer la valeur de l'argument
entree=$1
remplacement=$2

# Condition sur la valeur
case "$entree" in
  prepa)
    ## Renommer les repertoires créés par défaut

    mv ./models ./models.sav
    mv ./tests  ./tests.sav
    mv ./audits ./audits.sav
    mv ./seeds ./seeds.sav


    ## Création des nouveaux répertoires

    mkdir ./models
    mkdir ./tests
    mkdir ./audits
    mkdir ./seeds
    ;;
  exercice1)
    cp atelier-sqlmesh/exercice1/models/* ./models
    sed -i '' "s/sqlmesh_example/${remplacement}/g" ./models/stg_customers.sql
    sed -i '' "s/sqlmesh_example/${remplacement}/g" ./models/stg_order_items.sql 
    sed -i '' "s/sqlmesh_example/${remplacement}/g" ./models/stg_orders.sql
    sed -i '' "s/sqlmesh_example/${remplacement}/g" ./models/enriched_orders.sql  
    cp atelier-sqlmesh/exercice1/stg_customers.csv ./seeds
    cp atelier-sqlmesh/exercice1/stg_order_items.csv ./seeds
    cp atelier-sqlmesh/exercice1/stg_orders.csv ./seeds

    ;; 
  exercice2)
    cp atelier-sqlmesh/exercice2/macros.sql ./macros
    cp atelier-sqlmesh/exercice2/models/enriched_orders_with_macro.sql ./models
    sed -i '' "s/sqlmesh_example/${remplacement}/g" ./models/enriched_orders_with_macro.sql 
    ;;
  exercice3)
    cp atelier-sqlmesh/exercice3/* ./tests
    sed -i '' "s/sqlmesh_example/${remplacement}/g" ./tests/test_enriched_orders.yaml
    sed -i '' "s/sqlmesh_example/${remplacement}/g" ./tests/test_enriched_orders_with_macro.yaml
    ;;
  exercice4)
    cp atelier-sqlmesh/exercice4/* ./audits
    cp atelier-sqlmesh/exercice2/models/enriched_orders_with_macro_and_audit.sql ./models
    sed -i '' "s/sqlmesh_example/${remplacement}/g" ./audits/audit_enriched_orders_revenue.sql
    sed -i '' "s/sqlmesh_example/${remplacement}/g" ./models/enriched_orders_with_macro_and_audit.sql
    ;;
  *)
    echo "Valeur invalide : $entree"
    echo "Valeurs acceptées : prepa, exercice1, exercice2, exercice3, exercice4"
    exit 1
    ;;
esac
