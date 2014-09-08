IMG_TAG=sebmartin/jenkins
CONTAINER_NAME=jenkins

PORT=80

DATA_DIR=
M2_DIR=~/.m2


build: 
	@echo "$@ $(IMG_TAG)"
	@docker build -t $(IMG_TAG) .


run:
	@echo "$@ $(CONTAINER_NAME):$(IMG_TAG) [DATA_DIR=$(DATA_DIR)]"

ifeq ("$(wildcard $(DATA_DIR))", "")
	@echo "Répertoire des données non spécifié ou inexistant"
	@echo "Précisez le répertoire des données à utiliser en définissant la variable d'environnement DATA_DIR"
	@exit 1
endif

ifeq ("$(wildcard $(M2_DIR))", "")
	@echo "Répertoire M2 non spécifié ou inexistant"
	@echo "Précisez le répertoire M2 à utiliser en définissant la variable d'environnement M2_DIR"
	@exit 1
endif

	@docker run -d --name="$(CONTAINER_NAME)" -v $(DATA_DIR):/root/.jenkins -v $(M2_DIR):/root/.m2 -p $(PORT):80 $(IMG_TAG)

stop:
	@echo "$@ $(CONTAINER_NAME):$(IMG_TAG)"
	@docker kill $(CONTAINER_NAME)
	@docker rm $(CONTAINER_NAME)

clean:
	@echo "$@ $(IMG_TAG)"
	@docker rmi $(IMG_TAG)


