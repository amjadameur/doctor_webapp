# Doctor Patient Portal Automization

#### Credits:
The website sources are copied from **https://github.com/thegr8dev/doctorpatientportal** by **Ankit Kabra** (a.k.a **thegr8dev**)

#### The web app can be run in the following ways:
  * Vagrant.
  * Docker compose.
  * Build Docker manually.
  * Ansible AWS

### 1\. Vagrant:
This starts two VMs, one for Mysql and another for Apache2.

Webserver and Mysql can be accessed from port 80 and 3306
respectively.

#### Run Vagrant VMs:
```console
$ cd Vagrant
$ vagrant up
```

Finally access Web page from your browser: **http://localhost**

### 2\. Docker compose:
This starts two containers, one for Mariadb and another for Apache2/PHP.

Webserver and Mysql can be accessed from port **8080** and **3306**
respectively.

#### Run compose containers:
```console
$ cd Docker-compose
$ docker compose up -d
```

Finally access Web page from your browser: **http://localhost:8080**

### 3\. Build Docker manually:
This shows how to build necessary docker images to run them manually

#### Build web image:
```console
$ docker build --tag aouledameur/doctorweb:latest .
```
#### Build mariadb image:
```console
$ cd Docker-files
$ docker build --tag aouledameur/doctordb:latest .
```

#### Create docker network:
Web page will attempt accessing mariadb on **db01** domain name (Defined in includes/conn.php). Therefore, it is important to have the two containers in the same network in order to setup DNS aliases.
```console
$ docker network create doctornet
```

#### Run containers:
```console
$ docker run -d -p 3306:3306 --name doctordb --network doctornet --network-alias db01 aouledameur/doctordb:latest
$ docker run -d -p 8080:80 --name doctorweb --network doctornet aouledameur/doctorweb:latest
```

Finally access Web page from your browser: **http://localhost:8080**

### 4\. Ansible AWS:
This starts two EC2 instances, one for Mysql and another for Apache2.
It also does necessary setup for security groups, route 53 and keypair

#### Run playbook:
```console
$ cd Ansible
$ ansible-playbook doctor.yaml
```

Finally access Web page from your browser: **http://<public_ip_ec2_doctorweb>**

### Webpage Credentials
Admin login from webpage:

* email: admin@test.com
* pass: 123456

MySQL user:

  * user: doctorDbAdmin
  * pass: aJKYdtRKZaY4Zq5Y

**The above credentials are for test-only.**
