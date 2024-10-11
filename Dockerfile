FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y git curl wget sudo software-properties-common xsel

# add PPA
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -

# install C/C++, Python, vim, and nodejs
RUN apt-get update
RUN apt-get install -y gcc-14 g++-14 clangd clang-format python3.12 python3-pip pypy3 vim nodejs
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-14 10 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-14 10 && \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.12 10

# install python dependencies
RUN --mount=type=bind,source=data/requirements.txt,target=/tmp/requirements.txt \
    pip install --break-system-packages -r /tmp/requirements.txt

RUN ls -la /home/

RUN ls -la /home/ubuntu

# add user
ARG USERNAME=ubuntu
ARG PASSWORD=ubuntu
# https://askubuntu.com/questions/1513927/ubuntu-24-04-docker-images-now-includes-user-ubuntu-with-uid-gid-1000
# https://bugs.launchpad.net/cloud-images/+bug/2005129
RUN userdel -r $USERNAME && \
    useradd -m -u 1000 -s /bin/bash $USERNAME && \
    gpasswd -a $USERNAME sudo && \
    echo $USERNAME:$PASSWORD | chpasswd && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $USERNAME
WORKDIR /home/$USERNAME

# setup code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh
# install extensions from data/code-server/extensions.txt
RUN --mount=type=bind,source=data/code-server/extensions.txt,target=/tmp/extensions.txt \
    code-server --install-extension $(cat /tmp/extensions.txt)

# setup vim
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN --mount=type=bind,source=data/vim/.vimrc,target=/home/ubuntu/.vimrc vim +PlugInstall +CocInstall +'CocCommand clangd.install' +qa
RUN --mount=type=bind,source=data/vim/.vimrc,target=/home/ubuntu/.vimrc vim +CocInstall +qa
RUN --mount=type=bind,source=data/vim/.vimrc,target=/home/ubuntu/.vimrc vim +'CocCommand clangd.install' +qa

# setup AtCoder Library
RUN git clone https://github.com/atcoder/ac-library.git
ENV CPLUS_INCLUDE_PATH /home/$USERNAME/ac-library

# define pbcopy/pbpaste command
RUN echo 'alias pbcopy="xsel -b -i"' >> ~/.bashrc && \
    echo 'alias pbpaste="xsel -b -o"' >> ~/.bashrc

EXPOSE 8080

CMD ["/bin/bash"]
