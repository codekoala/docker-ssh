FROM codekoala/arch-s6
MAINTAINER Josh VanderLinden <codekoala@gmail.com>

ADD install.sh /install.sh
RUN /install.sh

EXPOSE 22
CMD ["/usr/bin/s6-svscan", "/services"]
