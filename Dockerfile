from python:3.7

RUN apt update -y; \
    apt install -y git vim; \
    python3.7 -m pip install pipenv wheel setuptools; \
    # Because that's just confusing!
    rm `which python3.9`

ENV WORKON_HOME=./venv
ENV PIPENV_PYPI_MIRROR=https://pypiserver.diamond.ac.uk
