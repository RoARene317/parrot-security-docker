# Import Security version of ParrotOS
FROM parrotsec/security:latest
# Make the Installer non interactive
ENV DEBIAN_FRONTEND=noninteractive
# Update everything first
RUN apt-get update && apt-get upgrade -y
# Install Parrot Mate HTB
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    -o Dpkg::Options::="--force-confdef" \
    -o Dpkg::Options::="--force-confold" \
    parrot-desktop-mate mate-applets mate-desktop-environment-extras 
# Install VNC & RDP
RUN apt-get install -y openssh-server dialog htop nano net-tools tigervnc-standalone-server tigervnc-xorg-extension tigervnc-viewer novnc dbus-x11 firefox-esr 
# Cleanup and Create users
RUN apt-get -y autoremove && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m -c "Parrot" -s /bin/bash -d /home/parrot parrot && \
    sed -i "s/#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/g" /etc/ssh/sshd_config && \
    sed -i "s/off/remote/g" /usr/share/novnc/app/ui.js && \
    echo "parrot ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    mkdir /run/dbus && \
    touch /usr/share/novnc/index.htm
# Create VNC
COPY startup.sh /startup.sh
USER parrot
WORKDIR /home/parrot
ENV PASSWORD=parrot
ENV SHELL=/bin/bash
EXPOSE 8080
ENTRYPOINT ["/bin/bash", "/startup.sh"]