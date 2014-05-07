FROM codekoala/arch-s6
MAINTAINER Josh VanderLinden <codekoala@gmail.com>

RUN pacman -Sqyu --noconfirm --needed openssh

# configure ssh
RUN sed -i \
        -e 's/^#*\(PermitRootLogin\) .*/\1 yes/' \
        -e 's/^#*\(PasswordAuthentication\) .*/\1 yes/' \
        -e 's/^#*\(PermitEmptyPasswords\) .*/\1 yes/' \
        -e 's/^#*\(UsePAM\) .*/\1 no/' \
        /etc/ssh/sshd_config

# setup the service
RUN mkdir -p /services/ssh
ADD run /services/ssh/run
ADD finish /services/ssh/finish

EXPOSE 22
CMD ["/usr/bin/s6-svscan", "/services"]
