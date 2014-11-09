#!/bin/bash

# Add Fix for Selinux sshd issue if host is RHEL 6
# re: https://groups.google.com/forum/#!topic/docker-user/73AiwlZEgY4
function update_selinux() {
    wget http://mirrors.kernel.org/ubuntu/pool/main/libs/libselinux/libselinux1_2.1.13-2_amd64.deb && dpkg --install libselinux1_2.1.13-2_amd64.deb
}

function create_vista_ewdjs_directories() {
    rm -rf /root/.ssh
    mkdir /root/.ssh
    chmod go-rx /root/.ssh
    mkdir /var/run/sshd
}

function deploy_vista_ewdjs_files() {
    cp /root/vista_ewdjs_files/id_rsa /root/.ssh
    chmod go-rwx /root/.ssh/id_rsa
    cp /root/vista_ewdjs_files/authorized_keys /root/.ssh/authorized_keys
    chmod go-wx /root/.ssh/authorized_keys
}		

function prepare_vista_ewdjs() {
    update_selinux
    create_vista_ewdjs_directories
    deploy_vista_ewdjs_files
}
