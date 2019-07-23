FROM alpine
RUN apk add openssh netcat-openbsd
RUN printf "PermitRootLogin yes\nAuthorizedKeysFile	/root/.ssh/authorized_keys\nSubsystem	sftp	/usr/lib/ssh/sftp-server" > /etc/ssh/sshd_config
RUN /usr/bin/ssh-keygen -A
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
