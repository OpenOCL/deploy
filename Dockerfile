FROM ubuntu:16.04

WORKDIR /app

COPY compile-casadi-linux-matlab.sh /app/

RUN apt-get update
RUN apt-get install sudo
RUN sh compile-casadi-linux-matlab.sh

CMD ["/bin/bash"]
