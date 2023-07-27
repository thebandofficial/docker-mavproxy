FROM python

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get autoremove -y \
    && apt-get install -y \
    && apt-get clean all
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade setuptools && \
    pip3 install --upgrade MAVProxy

COPY ./files/* /

RUN for SCRIPT in $(ls /*.sh) ; do \
        chmod +x ${SCRIPT} && \
        DEST=$(echo $SCRIPT | sed 's#.sh##g') && \
        mv -v ${SCRIPT} /usr/bin/${DEST} \
    ; done && \
    mkdir -p /var/log/mavproxy/
