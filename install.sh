#!/bin/bash

# install a pre-made s6 package
pacman -Sqyu --noconfirm --needed --noprogressbar openssh

# setup a services directory
SVDIR=/services/ssh
mkdir -p ${SVDIR}

# SSH service script
cat > ${SVDIR}/run <<EOT
#!/bin/bash

# generate our keys if needed
/usr/bin/ssh-keygen -A

# start OpenSSH server
echo "Starting SSHd..."
/usr/bin/sshd -D
EOT

cat > ${SVDIR}/finish <<EOT
#!/bin/bash

echo "Terminating SSHd..."
EOT
chmod +x ${SVDIR}/*

echo Configuring sshd...
sed -i -e 's/^#*\(PermitRootLogin\) .*/\1 yes/' \
       -e 's/^#*\(PasswordAuthentication\) .*/\1 yes/' \
       -e 's/^#*\(PermitEmptyPasswords\) .*/\1 yes/' \
       -e 's/^#*\(UsePAM\) .*/\1 no/' \
       /etc/ssh/sshd_config

# clean up the package cache
rm -rf /var/cache/pacman/* /install.sh
