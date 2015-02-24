FROM mattdm/fedora-small:f19
# originally from: https://registry.hub.docker.com/u/fujin/fedora/dockerfile/
MAINTAINER infrastructure@pantheon.io
ENV container docker
# Chef
RUN yum -y install gawk hostname
ADD https://www.opscode.com/chef/install.sh /install.sh
RUN bash /install.sh
# Packages
RUN yum -y install systemd systemd-libs sudo openssh-server openssh-clients curl
# Update everything, purge systemd services.
RUN yum -y update; yum clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

# OpenSSH Server Tweaks
RUN sed -i '/UsePAM/d'  /etc/ssh/sshd_config
RUN echo 'UsePrivilegeSeparation no' >> /etc/ssh/sshd_config
RUN echo 'UsePAM no' >> /etc/ssh/sshd_config
RUN ln -sf /usr/lib/systemd/system/sshd.service /etc/systemd/system/multi-user.target.wants/sshd.service

# test-kitchen
RUN useradd -d /home/kitchen -m -s /bin/bash kitchen
RUN echo "kitchen:kitchen" | chpasswd
RUN echo 'kitchen ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

VOLUME [ "/sys/fs/cgroup" ]
ENTRYPOINT ["/usr/sbin/init"]
