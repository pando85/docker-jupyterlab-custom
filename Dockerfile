FROM jupyter/scipy-notebook:latest

LABEL maintainer="Pando85 <pando855@gmail.com>"

USER root

RUN jupyter labextension install @jupyterlab/git@v0.20.0-rc.0 --no-build && \
    NODE_OPTIONS=--max-old-space-size=4096 jupyter lab build --LabBuildApp.dev_build=False && \
    jupyter lab clean -y && \
    npm cache clean --force && \
    rm -rf /home/$NB_USER/.cache/yarn && \
    rm -rf /home/$NB_USER/.node-gyp && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

USER $NB_UID
