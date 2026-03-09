#!/bin/bash
# TimeGuessr — script d'installation
set -e

echo "==> Creation de la base de donnees..."
sudo mysql < data/schema.sql

echo "==> Insertion des donnees initiales..."
sudo mysql timeguessr < data/seed.sql

echo "==> Lancement du serveur PHP..."
echo "    Jeu   : http://localhost:8080"
echo "    Admin : http://localhost:8080/admin.php  (mdp: timeguessr2025)"
php -S localhost:8080
