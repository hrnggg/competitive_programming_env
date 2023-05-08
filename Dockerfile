FROM ubuntu:22.04

RUN apt update && \
    apt install -y git curl wget sudo software-properties-common

# add PPA
RUN add-apt-repository -y ppa:jonathonf/vim && \
    apt update
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -

# install C/C++, Python, vim, and nodejs
RUN apt install -y gcc-12 g++-12 clangd clang-format python3.10 python3-pip pypy3 vim nodejs
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 10 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-12 10 && \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 10

# install python dependencies
COPY data/requirements.txt .
RUN pip install -r requirements.txt

# add user
ARG USERNAME=ubuntu
ARG PASSWORD=ubuntu
RUN useradd -m -u 1000 -s /bin/bash $USERNAME && \
    gpasswd -a $USERNAME sudo && \
    echo $USERNAME:$PASSWORD | chpasswd && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $USERNAME
WORKDIR /home/$USERNAME

# setup code-server
RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN code-server \
    --install-extension ms-python.python \
    --install-extension llvm-vs-code-extensions.vscode-clangd
# ms-vscode-cpptools does not exist on code-server
COPY --chown=$USERNAME:$USERNAME data/code-server/settings.json .local/share/code-server/User

# setup vim
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY --chown=$USERNAME:$USERNAME data/vim/.vimrc .
COPY --chown=$USERNAME:$USERNAME data/vim/coc-settings.json .vim
COPY --chown=$USERNAME:$USERNAME data/vim/user-snippets .vim/user-snippets
RUN vim +PlugInstall +qa

# setup AtCoder Library
RUN git clone https://github.com/atcoder/ac-library.git
ENV CPLUS_INCLUDE_PATH /home/$USERNAME/ac-library

COPY --chown=$USERNAME:$USERNAME data/entrypoint.sh .

EXPOSE 8080

CMD ["/bin/bash"]
