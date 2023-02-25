FROM ubuntu:22.04

RUN apt update && \
    apt install -y git curl wget sudo

# install C/C++ and Python
RUN apt install -y gcc-12 g++-12 clang-format python3.11 python3-pip pypy3
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 10 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-12 10 && \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 10

# install python dependencies
COPY requirements.txt /
RUN pip install -r requirements.txt

ARG USERNAME=ijub
ARG PASSWORD=ijub
RUN useradd -m -s /bin/bash $USERNAME && \
    gpasswd -a $USERNAME sudo && \
    echo $USERNAME:$PASSWORD | chpasswd && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
# su ijub
USER $USERNAME
WORKDIR /home/$USERNAME

RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN code-server --install-extension ms-python.python
# ms-vscode-cpptools

COPY --chown=$USERNAME:$PASSWORD docker-entrypoint.sh $HOME

EXPOSE 8080

CMD ["./docker-entrypoint.sh"]
