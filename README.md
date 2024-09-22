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

### Start server with Docker
- Download docker
```bash
$ apt install docker-ce -y
```
- And now, start the server.
```bash
$ docker build . -t innoverse-docker
$ docker run innoverse-docker
```
