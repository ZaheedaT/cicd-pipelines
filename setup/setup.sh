#/bash
# a bash script to setup the environment for the project
# install pip3
sudo apt-get install python3-pip -y
# install venv and create the virutual environment in the project root
python3 -m venv cicd-venv
# activate the virtual environment
source cicd-venv/bin/activate
# install packages you will need, ensuring they are being installed in the virtual env
cicd-venv/bin/pip3 install -r setup/requirements.txt