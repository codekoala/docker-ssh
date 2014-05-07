docker-ssh
==========

Docker build for OpenSSH on Arch. The daemon is managed by s6.

Notes
-----

These are all important things to know about this container. If you plan on
using this container, you should probably change these settings.

* logging into the container as root is enabled
* password authentication is enabled
* empty passwords are enabled
* the root user has no password by default
* PAM is disabled
