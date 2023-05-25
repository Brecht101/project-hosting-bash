#!/bin/bash
namespace=$1
rootpass=$2
phpmyadmin=$3
domain=$4
username=$5
delete_volume=$6

ansible-playbook -i /home/wael/project_hosting/create-project/hosts /home/wael/project_hosting/delete-project/playbook.yaml -e "new_namespace=$namespace database_root_password=$rootpass phpmyadmin_ingress_url_hosts=$phpmyadmin website_ingress_url_hosts=$domain username=$username delete_volume_mapping=$delete_volume" --extra-vars "ansible_ssh_pass=ansible ansible_become_pass=ansible"