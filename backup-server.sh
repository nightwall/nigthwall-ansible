#!/bin/bash

# Variables
USER=`whoami`
BACKUP_NAME="nightwall-server"
NOW=`date +%Y%m%d_%H%M%S`

# Déploiement des données
files=(${BACKUP_NAME}_*.tar.gz)
for ((i=${#files[@]}-1; i>=0; i--)); do
  echo "Décompression de ${files[$i]}"
  tar -x --use-compress-program=pigz -f ${files[$i]}
  echo "Done."
  break
done

# Launch backup
ansible-playbook ansible/backup/server.yml -i ansible/machines

# Compression de la sauvegarde
echo "Compression de la sauvegarde..."
tar -c --use-compress-program=pigz -f ${BACKUP_NAME}_${NOW}.tar.gz ${BACKUP_NAME}
echo "Done."

# Suppression des données non compressées
echo "Suppression des données non compressées"
rm -rf ./${BACKUP_NAME}/
echo "Done."

# Script end
echo "Backup completed"
sleep 2
