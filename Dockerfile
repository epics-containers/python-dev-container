from python:3.7

# Dev tools and libraries
RUN apt update -y; \
    apt install -y git vim sudo; \
    python3.7 -m pip install pipenv wheel setuptools

# Because that's just confusing!
RUN rm `which python3.9`

# Set up your own account in the image
ARG DEV_UNAME
ARG DEV_UID
ARG DEV_GID
ARG EMAIL
ARG FULLNAME
ENV EMAIL=${EMAIL}
ENV FULLNAME=${FULLNAME}
ENV HOME=/home/${DEV_UNAME}

RUN \
    : ${DEV_UNAME:? Build argument DEV_UNAME not set.} \
    : ${EMAIL:? Build argument EMAIL not set.} \
    : ${FULLNAME:? Build argument FULLNAME not set.}

WORKDIR /

# Allow all users inside the container to sudo
COPY /sudoers /etc/sudoers

# Pipenv will put virtualenvs next to projects and use the DLS internal PyPi
ENV WORKON_HOME=./venv
ENV PIPENV_PYPI_MIRROR=https://pypiserver.diamond.ac.uk

# Setup the container's home dirctory
WORKDIR /home/${DEV_UNAME}
COPY home /home/${DEV_UNAME}
RUN bash .setup_home.sh


CMD ["/bin/bash"]
