  
FROM jupyter/scipy-notebook:7a0c7325e470

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

USER root
RUN apt-get update && apt-get install -y gnupg
RUN wget -O /tmp/YANDEX-DISK-KEY.GPG http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG && apt-key add /tmp/YANDEX-DISK-KEY.GPG
RUN echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" >> /etc/apt/sources.list.d/yandex-disk.list
RUN apt-get update
RUN apt-get install -y yandex-disk

    
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
#RUN mkdir ${HOME}/data && wget -O ${HOME}/data/yellow_tripdata_2015-01-06.csv.gz https://s3-us-west-2.amazonaws.com/nyctlc/yellow_tripdata_2015-01-06.csv.gz

USER ${NB_USER}
