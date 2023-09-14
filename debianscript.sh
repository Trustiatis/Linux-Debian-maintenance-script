#!/bin/bash

# Script de maintenance Debian

# Enregistrez la date et l'heure du début de la maintenance
echo "Maintenance démarrée le $(date)"

# Mettez à jour le système
echo "Mise à jour du système..."
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo apt clean

# Sauvegarde des données importantes (à personnaliser)
echo "Sauvegarde des données importantes..."
rsync -av --exclude='/chemin/vers/dossier/source/exclude' /chemin/vers/dossier/source /chemin/vers/dossier/destination

# Vérifiez l'espace disque
echo "Vérification de l'espace disque..."
df -h

# Vérifiez l'utilisation de la mémoire
echo "Vérification de l'utilisation de la mémoire..."
free -h

# Videz les fichiers journaux anciens
echo "Nettoyage des fichiers journaux..."
find /var/log -type f -name '*.log' -exec truncate --size=0 {} \;

# Exécutez une analyse antivirus (exemple avec ClamAV, assurez-vous qu'il est installé)
#echo "Analyse antivirus..."
#sudo freshclam # Mettez à jour la base de données de signatures
#sudo clamscan -r /chemin/vers/dossier/à/analyser

# Enregistrez la date et l'heure de fin de la maintenance
echo "Maintenance terminée le $(date)"

# Enregistrez les informations de maintenance dans un fichier de journal
echo "Maintenance terminée le $(date)" >> /var/log/maintenance.log

# Envoyez un e-mail de notification (exemple avec ssmtp, assurez-vous qu'il est configuré)
#echo "Maintenance Debian terminée le $(date)" | mail -s "Maintenance Debian" votre@email.com

echo "Maintenance terminée."
