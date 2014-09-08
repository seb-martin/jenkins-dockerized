# Jenkins Dockerized

Une image docker de l'application web [Jenkins CI](http://jenkins-ci.org/).

## Docker Hub Registry

Le repo Docker [sebmartin/jenkins](https://registry.hub.docker.com/u/sebmartin/jenkins) est paramétré pour construire automatiquement l'image Docker à partir du repo GitHub [seb-martin/jenkins-dockerized](https://github.com/seb-martin/jenkins-dockerized).

### Pull du repository

```
docker pull sebmartin/jenkins
```

### Exécution du conteneur

```
docker run --name="jenkins" -v /path/to/data/directory:/root/.jenkins -v /path/to/m2/directory:/root/.m2 -p 83:80 -d sebmartin/jenkins
```

Ajuster les paramètres de la commande :

* Ajuster `-v /path/to/data/directory:/root/.jenkins`. Ce paramètre monte le volume `/path/to/data/directory` de la machine hôte sur le volume `/root/.jenkins` du conteneur docker.
* Ajuster `-v /path/to/m2/directory:/root/.m2`. Ce paramètre monte le volume `/path/to/m2/directory` de la machine hôte sur le volume `/root/.m2` du conteneur docker.
* Ajuster `-p 83:80`. Ce paramètre expose le port `80` du conteneur docker sur le port `83` de la machine hôte.

## GitHub

Les sources de l'image sont clonables depuis le repo [seb-martin/jenkins-dockerized](https://github.com/seb-martin/jenkins-dockerized).

### Clone du repository

```
git clone https://github.com/seb-martin/jenkins-dockerized.git
```

### Vagrant VirtualBox ###

```
> vagrant plugin install vagrant-vbguest
> vagrant up
> vagrant ssh
> cd /vagrant
```

### Linux Natif ###

Construire l'image docker

```
> make build
```

Exécuter le conteneur docker avec le port par défaut (80)

```
> make DATA_DIR=/path/to/data/directory M2_DIR=/path/to/m2/directory run
```

Exécuter le conteneur docker en spécifiant un port alternatif (ici 8080)

```
> make DATA_DIR=/path/to/data/directory M2_DIR=/path/to/m2/directory PORT=8080 run
```

Stopper l'exécution du conteneur docker

```
> make stop
```