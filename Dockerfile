# Use the official Ubuntu 20.04 image as the base image
FROM ubuntu:20.04

# Install SSH server
RUN apt-get update && \
    apt-get install -y openssh-server && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /var/run/sshd

# Set the root user's password (replace 'password' with your own secure password)
RUN echo 'root:Rabiu2004@' | chpasswd

# Allow SSH login as root
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose the SSH port (22) to the host
EXPOSE 22/tcp

# Start the SSH service when the container starts
CMD ["/usr/sbin/sshd", "-D"]
