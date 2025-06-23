FROM ubuntu:20.04

ARG USERNAME
ARG PASSWORD
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y sudo openssh-client openssh-server && \
    useradd -ms /bin/bash ${USERNAME} && \
    echo "${USERNAME}:${PASSWORD}" | chpasswd && \
    usermod -aG sudo $USERNAME

USER ${USERNAME}
WORKDIR /home/${USERNAME}
CMD ["/bin/bash", "-c", "sleep infinity"]