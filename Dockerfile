FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive
ENV USER=avidemux
RUN apt-get update; \
  apt-get upgrade; \
  apt-get --no-install-recommends --yes install wget
RUN wget http://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2016.8.1_all.deb
RUN dpkg -i /deb-multimedia-keyring_2016.8.1_all.deb
RUN echo "deb http://www.deb-multimedia.org buster main non-free" >/etc/apt/sources.list.d/deb-multimedia.list
RUN apt-get update
RUN apt-get --yes install avidemux
COPY /entrypoint.sh /
CMD /entrypoint.sh
