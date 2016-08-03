## BUILDING
##   (from project root directory)
##   $ docker build -t sauryadas-node-todo .
##
## RUNNING
##   $ docker run -p 3000:3000 sauryadas-node-todo
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:3000
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/stacksmith-images/ubuntu-buildpack:14.04-r8

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="avkuzwr" \
    STACKSMITH_STACK_NAME="sauryadas/node-todo" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install node-4.4.7-0 --checksum 2bc2f9e92412b0b3bc620e9f8c227fb2d85f980e068adbd626564b13990926d7

ENV PATH=/opt/bitnami/node/bin:/opt/bitnami/python/bin:$PATH \
    NODE_PATH=/opt/bitnami/node/lib/node_modules

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# Node base template
COPY . /app
WORKDIR /app

RUN npm install

CMD ["node"]
