#! /bin/bash
yum install -y yum-utils

yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo

wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

yum -y upgrade 

amazon-linux-extras install -y java-openjdk11
yum -y install jenkins
yum -y install terraform
yum -y install git

systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins