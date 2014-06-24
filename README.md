docker-ssh
==========

Docker build for OpenSSH on Arch. The daemon is managed by systemd.

Notes
-----

These are all important things to know about this container. If you plan on
using this container, you should probably change these settings.

* logging into the container as root is enabled
* password authentication is enabled
* empty passwords are enabled
* the root user has no password by default
* PAM is disabled

Launching This Container
------------------------

Currently, launching this container seems to need both the ``--privileged`` 
flag, as well as ``/sys/fs/cgroup`` to be mounted within the container.

    docker run --rm --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro codekoala/arch
