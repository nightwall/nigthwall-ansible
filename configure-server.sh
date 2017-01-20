############################################
# Lancement de la configuration du serveur #
############################################

# Lancement du playbook de configuration
ansible-playbook ansible/configuration/server.yml -i ansible/machines
