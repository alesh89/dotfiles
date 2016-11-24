prepare:
	sudo apt-get install software-properties-common
	sudo apt-add-repository -y ppa:ansible/ansible
	sudo apt-get update
	sudo apt-get install -y ansible git

common-software:
	ansible-playbook common-software.yml -i local --ask-sudo-pass

TAGS := always
development:
	ansible-galaxy install --force -r requirements.yml
	ansible-playbook development.yml -i local --ask-sudo-pass --tags $(TAGS) -v

dotfiles:
	ansible-playbook dotfiles.yml -i local
