FROM debian:stretch

LABEL maintainer="Alexis Pereda <alexis@pereda.fr>"
LABEL version="1.0"
LABEL description="Matterbot"

RUN apt update \
	&& apt install --no-install-recommends --no-install-suggests -y \
		python python-pip \
	&& rm -rf /var/lib/apt/lists/*

RUN pip install -U mattermost_bot

RUN rm -rf /usr/local/lib/python2.7/dist-packages/mattermost_bot/plugins/*
RUN ln -s /plugins /usr/local/lib/python2.7/dist-packages/mattermost_bot/userplugins

COPY bin/* /usr/local/bin/
COPY plugins/* /usr/local/lib/python2.7/dist-packages/mattermost_bot/plugins/

WORKDIR /usr/local/lib/python2.7/dist-packages/mattermost_bot/plugins/

VOLUME ["/plugins"]

CMD ["start"]
