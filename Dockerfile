FROM ubuntu:19.10

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
        build-essential \
        ca-certificates \
        curl \
        gcc \
        libpython3.7 \
        python3.7 \
        python3-distutils \
        python3-matplotlib \
    && rm -rf /var/lib/apt/lists/*
    
## install julia
RUN mkdir /opt/julia \
    && curl -L https://julialang-s3.julialang.org/bin/linux/x64/1.4/julia-1.4.0-linux-x86_64.tar.gz | tar zxf - -C /opt/julia --strip=1 \
    && chown -R 1000 /opt/julia \
    && ln -s /opt/julia/bin/julia /usr/local/bin

## setup unprivileged user
ARG NB_USER=cosmo
ARG NB_UID=1000
ENV USER $NB_USER
ENV NB_UID $NB_UID
ENV HOME /home/$NB_USER
RUN adduser --disabled-password --gecos "Default user" --uid $NB_UID $NB_USER
USER $NB_USER

ENV JULIA_PROJECT=$HOME
ENV PYTHON=python3

COPY --chown=1000 Foo $HOME/Foo
RUN julia -e 'using Pkg; pkg"dev ~/Foo; add PyPlot PackageCompiler; precompile"'
RUN julia -e 'using PackageCompiler; create_sysimage([:Foo],cpu_target="generic",replace_default=true)'
