FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive 
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
	&& apt-get install -y software-properties-common \
	&& add-apt-repository ppa:ondrej/php \
	&& apt-get update \
	&& apt-get install -y php7.4 \
	&& apt-get install -y php7.4-mbstring php7.4-xml php7.4-gd php7.4-zip php7.4-mysql php7.4-curl \
	&& apt-get install -y composer ansible npm yarn zip ssh rsync \
    	&& npm install -g npm@latest \
    	&& apt-get -y autoremove \
	&& rm -rf /var/lib/apt/lists/*
