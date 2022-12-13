SHELL := /bin/sh

.PHONY: ansible/init ansible/install ansible/playbook

ansible/init: ansible/install ansible/playbook

ansible/install:
	sudo add-apt-repository -y ppa:ansible/ansible-2.6
	sudo apt-get update
	sudo apt install -y ansible

ansible/galaxy:
	ANSIBLE_CONFIG='./ansible/ansible.cfg' ansible-galaxy install --role-file='./ansible/requirements.yml' --roles-path='./ansible/roles' --force

ansible/playbook:
	ANSIBLE_CONFIG='./ansible/ansible.cfg' ansible-playbook --inventory-file='./ansible/inventory' './ansible/playbook.yml'
