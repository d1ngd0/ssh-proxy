FROM alpine
RUN apk add openssh
RUN printf "PermitRootLogin prohibit-password\nAuthorizedKeysFile	.ssh/authorized_keys\nSubsystem	sftp	/usr/lib/ssh/sftp-server" > /etc/ssh/sshd_config
RUN /usr/bin/ssh-keygen -A
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
