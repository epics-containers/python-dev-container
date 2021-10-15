# Python Dev Container

Build/config for a container encompassing a Python 3 development environment


## Usage

First ensure your name and email are set correctly in your Git config: https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-github-user-account/managing-email-preferences/setting-your-commit-email-address

Build the container against your username with

```bash
./build
```

Run it with 

```bash
./run
```

Type `exit` or press CTRL-D to leave the container.

The container will mount a specific directory on your local machine where you should put your project files: `/scratch/${USER}/work` if available or `/home/${USER}/work`.
The directory will be mounted to `/local` inside the container. 


## Setting up Project Environment

Inside the container:

```bash
cd /local/<your project>
pipenv install --dev
```

This will create a virtualenv in `/local/<your project>/venv/<some arbitrary directory>`. Because `/local` is mounted this virtualenv will be reusable even if you restart the container.
