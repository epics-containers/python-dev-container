#!/bin/bash

echo """
[user]
	email = ${EMAIL}
	name = ${FULLNAME}
[core]
	editor = vim
""" > ${HOME}/.gitconfig

echo "source ~/.bashrc_local" >> ~/.bashrc
