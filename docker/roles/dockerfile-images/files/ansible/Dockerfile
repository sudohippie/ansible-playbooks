FROM ubuntu:latest
MAINTAINER Raghav Sidhanti <@sudohippie>

# Install dependencies
RUN apt-get -y update && \
    apt-get install -y python-yaml \
    python-jinja2 \
    python-httplib2 \
    python-keyczar \
    python-paramiko \
    python-setuptools \
    python-pkg-resources \
    python-pip \
    git \
    vim \
    openssh-server

RUN mkdir /var/run/sshd

# Install ansible
RUN mkdir /etc/ansible/
RUN mkdir /etc/ansible-playbooks/
RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts
RUN git clone http://github.com/ansible/ansible.git /opt/ansible
RUN git submodule update --init
ENV PATH /opt/ansible/bin:/bin:/usr/bin:/sbin:/usr/sbin
ENV PYTHONPATH /opt/ansible/lib
ENV ANSIBLE_LIBRARY /opt/ansible/library

# SSH access
# IMPORTANT: Security risk, you most probably want to remove keygen creation.
RUN ssh-keygen -q -t rsa -N '' -f /root/.ssh/id_rsa
RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

WORKDIR /opt/ansible-playbooks

EXPOSE 22

CMD /usr/sbin/sshd -D
