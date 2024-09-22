# innoverse-docker
- An official Docker Compose setup for self-hosting a Innoverse Server.

# How to use ?
### Setup
- Install git
```bash
apt install git
```
, then clone this project.
```bash
$ git clone https://github.com/InnoverseTeam/Innoverse-Patcher
$ cd Innoverse-Patcher
```

### Compiling using Docker
- Download docker and devkitpro.
```bash
$ docker build . -t innoverse-builder
$ docker run -it --rm -v .:/app innoverse-builder
```

- First step, install docker `$ apt install docker-ce -y`.
