## The Makefile includes instructions on environment setup and lint tests
# Create and activate a virtual environment
# Install dependencies in requirements.txt
# Dockerfile should pass hadolint
# app.py should pass pylint
# (Optional) Build a simple integration test

# setup:
# 	# Create python virtualenv & source it
# 	# source ~/.devops/bin/activate
# 	python3 -m venv ~/.devops

# install:
# 	# This should be run from inside a virtualenv
# 	pip install --upgrade pip &&\
# 		pip install -r requirements.txt

# test:
# 	# Additional, optional, tests could go here
# 	#python -m pytest -vv --cov=myrepolib tests/*.py
# 	#python -m pytest --nbval notebook.ipynb

# lint:
# 	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
# 	# This is linter for Dockerfiles
# 	hadolint Dockerfile
# 	# This is a linter for Python source code linter: https://www.pylint.org/
# 	# This should be run from inside a virtualenv
# 	pylint --disable=R,C,W1203,W1202 app.py

# all: install lint test

setup:
	# Create python virtualenv & source it
	# source ~/.devops/bin/activate
	python3 -m venv ~/.devops

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
		pip install -r requirements.txt
		
	wget -O ./hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
	chmod +x ./hadolint

	# wget -O /bin/minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
	# # chmod +x /bin/minikube
	# 	sudo install minikube-linux-amd64 /usr/local/bin/minikube
	
	# curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
	# chmod +x ./kubectl
	# mv ./kubectl /usr/local/bin/kubectl
	
test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	./hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203,W1202 app.py

all: install lint test