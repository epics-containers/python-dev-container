from python:3.7

# Dev tools and libraries
RUN apt update -y; \
    apt install -y git vim sudo; \
    python3.7 -m pip install pipenv wheel setuptools

# Because that's just confusing!
RUN rm `which python3.9`

# Allow all users inside the container to sudo
COPY /sudoers /etc/sudoers

# Pipenv will put virtualenvs next to projects and use the DLS internal PyPi
ENV WORKON_HOME=./venv
ENV PIPENV_PYPI_MIRROR=https://pypiserver.diamond.ac.uk

CMD ["/bin/bash"]
