[![CircleCI](https://dl.circleci.com/status-badge/img/gh/GA-Simon/project4demo/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/GA-Simon/project4demo/tree/main)


## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

* Create a virtualenv with Python 3.7 and activate it. Refer to this link for help on specifying the Python version in the virtualenv. 
```bash
python3 -m pip install --user virtualenv
# You should have Python 3.7 available in your host. 
# Check the Python path using `which python3`
# Use a command similar to this one:
python3 -m virtualenv --python=<path-to-Python3.7> .devops
source .devops/bin/activate
```
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container
* Run via kubectl


Tasks

To see the screenshots of each task go to the screenshots directory.
1. Complete the Dockerfile

    Specify your python version
    Specify a working directory.
    Copy the app.py source code to that directory
    Install any dependencies in requirements.txt (make install)
    Expose a port when the container is created (port 80 is standard).
    Specify that the app runs at container launch.

    Note: If you want to install python dependencies and hadolint use make install-all

To run make lint don't forget crete and active the virtual env before:

$ make setup # create the virtual env
$ source ~/.devops/bin/activate # active the virtual env
$ make lint

2. Run a Container & Make a Prediction

    Build the docker image from the Dockerfile; it is recommended that you use an optional --tag parameter as described in the build documentation.
    List the created docker images (for logging purposes).
    Run the containerized Flask app; publish the container’s port (80) to a host port (8000).

Run the container using the run_docker.sh script created before following the steps above:

$ . ./run_docker.sh # Check the `Workarounds` section if you want to get more information about this.

After running the container (docker app) we can able to run the prediction using the make_prediction.sh script:

$ . ./make_prediction.sh # Don't forget run the container before

3. Improve Logging & Save Output

    Add a prediction log statement
    Run the container and make a prediction to check the logs

    Note: If you don't see any logs on your terminal you can use the docker logs command, to get container id of your docker app you can use docker ps and used that with the docker logs command. e.g: docker ps and the container id is 056eea11f5da your command to get the logs is docker logs 056eea11f5da

$ docker ps

CONTAINER ID        IMAGE                                               COMMAND                CREATED              STATUS              PORTS                                   NAMES
056eea11f5da        gsimondocker/udacity-devops-ml-ms-kubernetes        "python app.py         5 minutes ago        Up to 5 minutes     0.0.0.0/8000->80, :::8000->80/tcp       competent_ride

    Note: Don't forget copy the output to docker_out.txt

4. Upload the Docker Image

    Create a Docker Hub account
    Built the docker container with this command docker build --tag=<your_tag> . (Don't forget the tag name)
    Define a dockerpath which is <docker_hub_username>/<project_name> e.g: minorpath/kubernetes-p4
    Authenticate and tag image
    Push your docker image to the dockerpath

    Note: replace <your_tag> with the tag name that you want to use. For example: api -> docker build --tag=api .

After complete all steps run the upload using the upload_docker.sh script:

$ . ./upload_docker.sh

5. Configure Kubernetes to Run Locally

    Install Kubernetes
    Install Minikube

    Note: Check the Workarounds section for common issues.

6. Deploy with Kubernetes and Save Output Logs

    Define a dockerpath which will be <docker_hub_username>/<project_name>, this should be the same name as your uploaded repository (the same as in upload_docker.sh)
    Run the docker container with kubectl; you’ll have to specify the container and the port
    List the kubernetes pods
    Forward the container port to a host port, using the same ports as before

After complete all steps run the kubernetes using run_kubernetes.sh script:

$ . ./run_kubernetes.sh

After running the kubernete make a prediction using the make_prediction.sh script as we do in the second task.

    Note: Don't forget copy the output to the kubernetes_out.txt

7. Delete Cluster

If you want to delete the kubernetes cluster just run this command minikube delete. You can also stop the kubernetes cluster with this command minikube stop
8. CircleCI Integration

    Create a CircleCI Account (use your Github account for a better integration)
    Create a config using this template
    Add a status badge using this template: [![<github_username>](https://circleci.com/gh/<github_username>/<repository>.svg?style=svg)](https://circleci.com/gh/<github_username>/<repository>) replace <github_username> and <repository> with your data. e.g: [![danilobrinu](https://circleci.com/gh/danilobrinu/udacity-cloud-devops-engineer-project-4.svg?style=svg)](https://circleci.com/gh/danilobrinu/udacity-cloud-devops-engineer-project-4) and paste on top of your readme file.

Workarounds
Minikube

Minikube common issues: Out of memory or No space left on the device. Change the instance type from t2.micro to t2.medium and ensure at least 4GB of free space and 2GB of memory on the device. You can all docker images using this command docker system prune -a or remove all unused or dangling image with this command docker system prune
Bash scripts

Sometimes you can't run a bash script using this format ./run_docker.sh but you have some alternative like bash run_docker.sh or . ./run_docker.sh

    Note: This is the same for all scripts (*.sh)

Adding tests

Add pytest to the requirements.txt file and update the Makefile to add this command python3 -m pytest -vv test_app.py which is the file that contains the tests for home and predict endpoints.
Linting warnings

The warning for logging format interpolation appears when we want to use f-strings but we can disable using W1202. So we need change this command pylint --disable=R,C,W1203 to pylint --disable=R,C,W1202
Tests on Circle CI

For pytest: https://circleci.com/docs/2.0/collect-test-data/#pytest
Kubernetes running docker image

Don't use 80 as a port. e.g: kubectl run app --image=$dockerpath --port=80 you can have some troubles with the forwarding of that port. Use a different port like 8080 e.g: kubectl run app --image=$dockerpath --port=8080 so now you can forward that port with kubectl port-forward deployment/app 8080:80.

    Don't forget update the make_prediction.sh script to use the same port as you are using to run the docker app (with or without kubernetes)



Thank You All!
