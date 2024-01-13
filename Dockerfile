FROM ubuntu:22.04

WORKDIR /workspace

RUN apt update

RUN apt-get install -y git g++-multilib make

RUN git clone https://github.com/ELENA-LANG/elena-lang /opt/elena-lang

WORKDIR /opt/elena-lang

RUN make all_i386

WORKDIR /opt/elena-lang/install/i386

RUN sed -i -e 's/echo "Do you wish .*/exit 0/' build_package_i386.script && \
    ./build_package_i386.script

WORKDIR /code

COPY bin .

CMD "./run.sh"