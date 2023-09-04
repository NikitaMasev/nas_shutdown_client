FROM dart:stable as builder

ENV PORT_NAS=""
ENV IP_NAS=""
ENV USERNAME_NAS=""
ENV PASSWORD_NAS=""

ENV PORT_CLIENTS="5090"
ENV IP_CLIENTS="localhost"
ENV KEY_CLIENTS="0123456789561011"
ENV IV_CLIENTS="0123456789561011"
ENV NAME_DEVICE="nas_shutdown"

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y sqlite3 libsqlite3-dev
COPY . /nas_shutdown_client
WORKDIR /nas_shutdown_client
RUN dart pub get
RUN dart compile exe ./lib/main.dart -o ./nas_shutdown_client
CMD ["./nas_shutdown_client"]