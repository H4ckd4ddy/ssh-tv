FROM python:3.7

RUN apt update;apt install -y openssh-server python3-opencv

RUN pip install opencv-python video-to-ascii

RUN mkdir -p /run/sshd

ADD sshd_config /etc/ssh/sshd_config

ADD play.sh /
RUN chmod +x /play.sh

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]