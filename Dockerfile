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

# https://plotly.com/python/getting-started/#jupyterlab-support
RUN conda install -y nltk plotly python-graphviz
# https://jupyter-docker-stacks.readthedocs.io/en/latest/using/recipes.html#using-pip-install-or-conda-install-in-a-child-docker-image
RUN fix-permissions $CONDA_DIR
RUN jupyter labextension install jupyterlab-plotly

RUN fix-permissions /home/$NB_USER
