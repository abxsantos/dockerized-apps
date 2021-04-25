#!/bin/bash

DOCKERFILE_ROOT_FOLDER="$(pwd)/dockerfiles"
for DOCKERFILE_PATH in $DOCKERFILE_ROOT_FOLDER/*
do
    PACKAGE="${DOCKERFILE_PATH##*.}"
    echo "#######################################################################"
    echo "Building docker image for [${PACKAGE}]"
    docker build --quiet -f "dockerfiles/Dockerfile.${PACKAGE}" -t "abxsantos/${PACKAGE}" $DOCKERFILE_ROOT_FOLDER \
    && echo "Successfully built image for [${PACKAGE}]" || echo "Error building image for [${PACKAGE}]!"
    echo "======================================================================="
    echo "Pushing [abxsantos/${PACKAGE}] to docker.io"
    docker push --quiet "abxsantos/${PACKAGE}" \
    && echo "Successfully pushed image [abxsantos/${PACKAGE}]" || echo "Error pushing image for [abxsantos/${PACKAGE}]!"
    printf "#######################################################################\n\n"
done
echo "Finished running the script!"
