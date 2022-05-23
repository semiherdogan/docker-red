# docker-red
Docker repository for running red language REPL.

> Main purpose of this repository is running red language on macos.

--- 

Before running red, create a docker volume for compiled console as below:

```
docker volume create red-console
```

Then you can run it like below:

```bash
docker run --rm -it --platform=linux/386 -v red-console:/root/.red hasansemih/red
```

Or if you want to volume directory, you may run like this:

```bash
docker run --rm -it --platform=linux/386 -v red-console:/root/.red -v "${PWD}":/var/app hasansemih/red
```

**Note**

For daily usage i'm using with alias as below:
```bash
alias red-with-folder='docker run --rm -it --platform=linux/386 -v red-console:/root/.red -v "${PWD}":/var/app hasansemih/red'

# alias red='docker run --rm -it --platform=linux/386 -v red-console:/root/.red hasansemih/red'
red() {
    docker run --rm -it --platform=linux/386 \
        -v red-console:/root/.red \
        -v "$HOME/Projects/custom-red-language-scripts":/var/scripts \
        -e CLIP="$(pbpaste)" \
        hasansemih/red
}

```
