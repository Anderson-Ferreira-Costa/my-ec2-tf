#!/bin/bash
wget https://translators-connectors-releases.s3.amazonaws.com/mongomirror/binaries/linux/mongomirror-linux-x86_64-enterprise-amazon2-0.12.8.tgz
tar xvzf mongomirror*
sudo mv mongomirror*/bin/mongomirror /usr/bin
rm mongomirror* -rf

echo "[mongodb-org-7.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2/mongodb-org/7.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-7.0.asc" > /etc/yum.repos.d/mongodb-org-7.0.repo

yum -y install mongodb-org-tools