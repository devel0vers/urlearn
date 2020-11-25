# mysql
FROM mysql:5.7

# timezone
RUN echo "Australia/Perth" > /etc/timezone
RUN rm -f /etc/localtime
RUN dpkg-reconfigure -f noninteractive tzdata

# update repo
RUN apt-get -y update --fix-missing
RUN apt-get upgrade -y

# install useful tools
RUN apt-get -y install \
	apt-utils \
	net-tools \
	openssh-server \
	autossh \
	wget \
	nano \
	vim \ 
	dialog