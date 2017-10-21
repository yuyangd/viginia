# Deploy a simple Django app

Target to develop a solution to host a Django app in a local environment.

Provisioning plan

Build a stack with the following tiers:  
- Nginx: serve static content
- Gunicorn: serve the Django application
- PostgreSQL: store data

### Setup local environment
Use vagrant and virtualbox to provision the local environment

The image used for this application is centos 7 vagrant box, which can be download from here:
https://app.vagrantup.com/centos/boxes/7

The centos7 vagrant box version: v1708.01
The virtualbox version: 5.1.28

Edit `local_vagrant_settings.rb`

local_vagrant_settings has defined the vagrant box, CPU and Memory required and the ports required mapping to the guest machine.

By default port 80 from the vagrant machine has mapped to port 8000, therefore, once the server is up, you can access the website at http://127.0.0.1:8000

To get the vagrant box up and running, go to the root directory of this repository and type command:

```
$ vagrant up
```

### Troubleshooting

For mount shared folder error:
```
vagrant plugin install vagrant-vbguest
```

### Ansible playbook and roles

Vagrant will run playbook-vagrant.yml with below roles:

- local:
Install the basic required dependencies
Those dependencies may not required in a cloud environment

- proxy:
Install and config Nginx to run as a reverse proxy as well as a web server.
The reverse proxy is to serve the socket from backend
The webserver is to serve the static content generated from Django

- db:
Use PostgreSQL to store the data

- gunicorn:
Use gunicorn to run the application server

- app:
Create the app role to run the deployment script

- ruby (not required for production): 
Install ruby, bundle for serverspec testing

### Deployment overview

Database will be restored from a backup pgsql file

Application will be stored in /repo/viginia as it is.

Static content will be stored in nginx root directory, /var/www/static


### Security and encryption


### Run system tests

Run system tests

```
$ vagrant ssh
$ cd /repo/tests/system
$ bundle install
$ rake spec
```
