# https://github.com/jeremyckahn/vim-docker-env/blob/master/Dockerfile

FROM ubuntu:focal

# environment variables
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      curl \
      git \
      gnupg \
      neovim \
      python-dev \
      python3-dev \
      python3-neovim \
      python3-pip \
      software-properties-common \
      sudo \
      tmux \
      wget \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -r -s /bin/bash vimuser && \
    passwd -d vimuser && \
    echo 'vimuser ALL=(ALL) ALL' > /etc/sudoers.d/vimuser && \
    mkdir -p /home/vimuser/.gnupg && \
    echo 'standard-resolver' > /home/vimuser/.gnupg/dirmngr.conf && \
    chown -R vimuser:vimuser /home/vimuser

WORKDIR /work
ENV HOME /home/vimuser

COPY .config/ /home/vimuser/.config/
COPY .local/ /home/vimuser/.local/
COPY .tmux.conf /home/vimuser/.tmux.conf
COPY .bashrc /home/vimuser/.bashrc

RUN echo "PS1='\${debian_chroot:+(\$debian_chroot)}\\[\033[01;32m\\]\\u@\\H\[\\033[00m\\]:\\[\\033[01;34m\\]\\w\\[\\033[00m\\]\\$ '" >> ~/.bashrc

RUN chown -R vimuser:vimuser $HOME
USER vimuser

CMD ["bash"]
