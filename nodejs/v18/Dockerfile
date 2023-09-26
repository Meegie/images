FROM node:18-bullseye

RUN apt update -y
RUN apt upgrade -y

RUN apt install bash -y
RUN apt install libssl-dev -y
RUN apt install clang-11 g++ cmake build-essential checkinstall zlib1g-dev -y


RUN apt install ca-certificates curl ffmpeg git openssl tar tzdata -y
RUN apt install sqlite3 iproute2 -y
RUN apt install gcc g++ -y
RUN apt install libgcc1 libc++-dev gdb libc6 git wget curl tar zip unzip binutils xz-utils liblzo2-2 -y
RUN apt install cabextract iproute2 net-tools netcat telnet libatomic1 libsdl1.2debian libsdl2-2.0-0 -y
RUN apt install libfontconfig icu-devtools libunwind8 libssl-dev sqlite3 libsqlite3-dev -y
RUN apt install locales ffmpeg gnupg2 apt-transport-https software-properties-common ca-certificates tzdata -y
RUN apt install libz-dev rapidjson-dev  -y

COPY        entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

RUN adduser -D -h /home/container container
ENV         USER=container HOME=/home/container
USER        container
WORKDIR     /home/container

ENTRYPOINT [ "/bin/bash" ]
CMD ["/entrypoint.sh"]