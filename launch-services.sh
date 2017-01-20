####################################
# Lancement des dockers du serveur #
####################################

# Lancement du playbook de configuration
ansible-playbook ansible/docker-containers/server.yml -i ansible/machines
