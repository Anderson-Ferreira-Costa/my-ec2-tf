#!/bin/bash
wget https://translators-connectors-releases.s3.amazonaws.com/mongomirror/binaries/linux/mongomirror-linux-x86_64-enterprise-amazon2-0.12.8.tgz
tar xvzf mongomirror*
sudo mv mongomirror*/bin/mongomirror /usr/bin