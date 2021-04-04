# ubuntu-tmux-vim

![docker-build-push](https://github.com/kguidonimartins/ubuntu-tmux-vim/workflows/docker-build-push/badge.svg?branch=main)

# Clone

```bash
git clone https://github.com/kguidonimartins/ubuntu-tmux-vim.git
```

# Build

```bash
make build
```

# Run

```bash
docker run -it --rm --user root -v $(pwd):/work -w /work kguidonimartins/ubuntu-tmux-vim
```

<!--
# Run

```bash
make run
```
-->

## Install basic languages

Inside the container, install basic languages.

```bash
cd $HOME && install-libs --all
```

After basic installation, you have a fully IDE inside this container.

![](images/tmux-docker.png)

<!--
## Commit changes

```bash
# get container id
docker ps
# commit
docker commit <container_id> <new_image_name>
```

# Run the new image

```bash
docker run -it --rm -v $(pwd):/work -w /home/vimuser <new_image_name>
# assim funciona também não tenho acesso às coisas que eu quero (plugins e tal)
docker run -it --rm --user $(id -u) -v $(pwd):/work -w /work kguidonimartins/ubuntu-tmux-vim
# assim também vai
docker run -it --rm --user root -v $(pwd):/work -w /work kguidonimartins/ubuntu-tmux-vim
```

-->

## NOTES

https://medium.com/@ls12styler/docker-as-an-integrated-development-environment-95bc9b01d2c1











