# Windows Developer Environment #

### Description ###

This project contains the core automation required to ensure a consistent development environment across Windows 7, 8, 8.1 and 10.
While Windows 10 contains the hypervisor support required to run Docker for Windows, unfortunately Windows 7 does not. This project,
therefore, uses Vagrant to build and manage a local VM and runs applications within Docker containers running in the guest VM. In 
this way, developers making use of both Windows 7 and 10 can make use of the same development environment.

### Technology Stack ###

This project is structured in such a way as to allow locally developed applications to automatically run on a local VirtualBox VM. 
These application will run in Docker containers and are defined using Docker-Compose files. Vagrant is used to provision and configure 
the VM and serves as a utility to manage containers running in the VM. Vagrant, VirtualBox, Docker-Compose and Docker are required in 
order to run this project locally.

It is highly recommended that engineers become acquainted with various supporting technologies. You can find more information here:

- Read more about [Vagrant](https://www.vagrantup.com/docs/getting-started/) *(https://www.vagrantup.com/docs/getting-started/)*
- Read more about [VirtualBox](https://www.virtualbox.org/manual/UserManual.html) *(https://www.virtualbox.org/manual/UserManual.html)*
- Read more about [Docker](https://www.docker.com/tryit/) *(https://www.docker.com/tryit/)*
- Read more about [Docker Compose](https://docs.docker.com/compose/) *(https://docs.docker.com/compose/)*

### Developer Environment Prerequisites ###

Since docker is dependent on key components of the Linux kernel, it must be run on Linux. If a developer is already running Linux
natively, she needs only to [install docker on Linux](https://docs.docker.com/engine/installation/linux/ubuntulinux/) in order to run
the application locally. If, however, a developer is running on Windows 7, then she must run a local VM with a kernel supported by Docker.
 
It is suggest that developers install Vagrant, VirtualBox and Docker Toolkit locally on Windows 7 in order to support these requirement:

- Install [Vagrant](https://www.vagrantup.com/docs/installation/) *(https://www.vagrantup.com/docs/installation/)*
- Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) *(https://www.virtualbox.org/wiki/Downloads)*
- Install [Docker Toolbox](https://www.docker.com/products/docker-toolbox) *(https://www.docker.com/products/docker-toolbox)*

Also note that your local git installation should be configured to use the appropriate hhtp proxy (if required):

    > git config --global http.proxy http://proxy.mydomain.com:80    

**NOTE:* Windows 10 users _must_ disable Hyper-V in order to make use of VirtualBox & Vagrant. 

### Project directory layout

    .
    ├── apps                      # Application source parent directory
    │   ├── sample-react-app         # Sample React application
    │   └── sample-flask-app         # Sample Python application
    ├── images                    # Documentation files (alternatively `doc`)
    │   ├── python-2.7-dev           # Core Python 2.7 dev image source files
    │   ├── react-dev                # Core React dev image source files
    │   ├── centos-dev               # Core CentOS dev image source files, pre-configured for dev use
    │   └── ubuntu-dev               # Core Ubuntu dev image source files, pre-configured for dev use
    ├── .gitignore                # VM hidden directories/files ignored
    ├── README.md                 
    ├── Vagrantfile               # VM automation file
    └── vm                        # VM management script

### Spin up your VM ###

You can execute the following command locally to provision and configure your VM:

    $ ./vm up

You can, then, run an application in a container in your VM as follows:

    $ ./vm start sample-flask-app

If you navigate to http://localhost:3000/, you will see the response "Flask Dockerized" in your browser.
        
> *NOTE:* The initial set up of the VM will take a few minutes. 
        
### Configuring you applications ###

Applications can be added to the 'apps' directory and are expected to contain a 'docker-compose.yml' file, which define the manner in which
an application container should be provisioned.

> *NOTE:* Ports 3000 - 3020 have be pre-configured to forward all traffic from your host PC to your guest linux VM. If ports within that range
> are used by application containers, they application will be automatically accessible on the host PC.
        
### Additional Commands ###

Below is a list of commands to interact with a application running in a docker container in your local VM:
   
- ./vm stop <app-name>: Stop the app:

    `$ ./vm stop sample-flask-app`

- ./vm restart <app-name>: Restart the app:

    `$ ./vm restart sample-flask-app`
    
- ./vm clean <app-name>: Stop the app and clean up all volumes and containers

    `$ ./vm clean sample-flask-app`

- ./vm logs <app-name>: Tail the container logs of the supplied application

    `$ ./vm logs sample-flask-app`
  
- ./vm ssh: SSH into the VM:

    `$ ./vm ssh`

- ./vm ssh <app-name>: Create a terminal session into the running app container:

    `$ ./vm ssh sample-flask-app`
    
- ./vm destroy: Completely delete the local VM and all associated files

    `$ ./vm destroy`

- ./vm docker <docker-cli-command> <docker-cli-args>: Run arbitrary docker commands

    `$ ./vm docker ps -a`

- ./vm docker-compose <app-name> <docker-compose-cli-command> <docker-compose-cli-args>: Run arbitrary docker-compose commands

    `$ ./vm docker-compose sample-flask-app run app`

- ./vm standalone <app-name>: Create a standalone app container

    `$ ./vm standalone sample-flask-app`

### Adhoc Containers ###

Adhoc containers can be created by referencing the relevant base image and creating a container using the 
docker cli. An example is as follows:

    # create a new container using an existing image
    $ ./vm docker run --name adhoc -it -p 3003:5000 -v /var/local/dev-env/apps/sample-flask-app:/var/local/app python-2.7- dev bash

    # remove adhoc container
    $ ./vm docker rm adhoc
