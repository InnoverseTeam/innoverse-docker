# innoverse-docker
- An official Docker Compose setup for self-hosting a Innoverse Server.

# How to use ?
### Setup
- First, Install git.
```bash
$ apt install git -y
```
- And clone this project.
```bash
$ git clone https://github.com/InnoverseTeam/innoverse-docker
$ cd innoverse-docker
```

### Install packages and Start the server
- Download docker
```bash
$ apt install docker-ce -y
```
- And now, install the packages.
```bash
$ docker build . -t innoverse-docker
$ docker run innoverse-docker
```
- After this step, now you can start the server.
```bash
$ python3 deployer.py start
```
- If you want stop the server.
```bash
$ python3 deployer.py stop
```
