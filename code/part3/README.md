## Enviroment setup for Remote Machines

In [Command-line Environment](../../docs/part3-command-line-environment.md) section, we need to setup remote machines to do those exercises. Here I use Docker to simulate a network of 2 machines, an SSH server (`ssh-server`) and an SSH client (`ssh-client`).

### Getting started

Make sure you have Docker and Docker Compose installed on your machine. Here are some links to download them:

- [Docker](https://docs.docker.com/engine/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)

Run the following command to start the machines
```bash
docker compose -p part3 up -d
```

Start the ssh server in the server machine
```bash
docker exec -it ssh-server bash  # Exec into the server container

## Inside the container
sudo service ssh start  # Start ssh service
exit  # Exit the container
```

Test the SSH connection to the server from the client
```bash
docker exec -it ssh-client bash  # Exec into the client container

## Inside the container
ssh server@ssh-server
```

*Note: The login credentials are in the `docker-compose.yml` file*

### Connect/Disconnect container from network

Docker Compose automatically creates a network `part3_ssh-net` for the SSH client and SSH server. If you want to connect/disconnect a machine from this netowork, run the following commands

```bash
docker network (dis)connect part3_ssh-net ssh-{client|server}
```

### Cleanup

When you are done, clean up all containers and network

```
docker compose down
```