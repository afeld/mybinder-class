FROM jupyter/scipy-notebook:7a0c7325e470

USER root
RUN apt-get update && \
  apt-get install -y gnupg
RUN wget -O /tmp/YANDEX-DISK-KEY.GPG http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG && \
  apt-key add /tmp/YANDEX-DISK-KEY.GPG
RUN echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" >> /etc/apt/sources.list.d/yandex-disk.list
RUN apt-get update && \
  apt-get install -y yandex-disk
USER $NB_USER

RUN fix-permissions /home/$NB_USER
