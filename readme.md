# Apache Livy Server for Docker


## Starting the Docker container

* Step 1: Clone the repository by running the following command
    ```
    git clone https://github.com/frozencure/apache-livy-docker.git
    ```

* Step 2: Build and start the container by running the following command inside the cloned repository:
    ```
    docker-compose up
    ```

* Step 3: Visit `localhost:8998` in your browser and make sure the Livy Server is running

## About

This repository contains a minimal *Dockerfile* that provides a local, Apache Livy server running on top of Apache Spark.

The built image will contain the following:

* The Java SE 1.8 JDK
* The Hadoop (2.7) and Apache Spark (2.4.4) binaries
* Apache Livy (0.6.0) source files

If you also want to use `PySpark` you will have to add a Python intepreter to the `Dockerfile`

## Preequesites

In order to be able to run the Apache Livy server you will have to first install **Docker** (Community Edition is sufficient):

* [Installing Docker on Windows](https://docs.docker.com/docker-for-windows/install/)

* [Installing Docker](https://docs.docker.com/v17.09/engine/installation/)

