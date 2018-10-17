FROM debian:stretch

LABEL maintainer="Alexis Pereda <alexis@pereda.fr>"
LABEL version="2.2"
LABEL description="Matterbot (mmpy_bot)"

RUN apt update \
	&& apt install --no-install-recommends --no-install-suggests -y \
		python python-pip \
	&& rm -rf /var/lib/apt/lists/*

RUN pip install -U schedule mmpy_bot

RUN rm -rf /usr/local/lib/python2.7/dist-packages/mmpy_bot/plugins/*
RUN ln -s /plugins /usr/local/lib/python2.7/dist-packages/mmpy_bot/userplugins

COPY bin/* /usr/local/bin/
COPY plugins/* /usr/local/lib/python2.7/dist-packages/mmpy_bot/plugins/

WORKDIR /usr/local/lib/python2.7/dist-packages/mmpy_bot/plugins/

VOLUME ["/plugins"]

CMD ["start"]
