#
# Hansoft server Dockerfile
#
# https://github.com/patrikha/hansoftserver
#

# pull base image
FROM ubuntu:20.04

ARG HANSOFT_VERSION

RUN apt clean
RUN apt update

RUN apt install -y --no-install-recommends curl unzip

RUN echo ${HANSOFT_VERSION}

# install Hansoft server
RUN curl -k -o HansoftServerX64.zip -A "Mozilla/5.0 (compatible; MSIE 7.01; Windows NT 5.0)" -L https://cache.hansoft.com/Hansoft+Server+${HANSOFT_VERSION}+Linux2.6+x64.zip
# RUN curl -k -o HansoftServerX64.zip -A "Mozilla/5.0 (compatible; MSIE 7.01; Windows NT 5.0)" -L https://cache.hansoft.com/Hansoft+Server+11.1006+Linux2.6+x64.zip
RUN unzip -d /opt/ HansoftServerX64.zip
RUN rm HansoftServerX64.zip
COPY server.config /opt/HansoftServer/
# COPY Backup /opt/HansoftServer/
# COPY runserver.sh /opt/HelixPlanServer/
COPY run.sh /opt/

# create user Hansoft
RUN useradd -m hansoft && \
    cp /root/.bashrc /home/hansoft/ && \
    mkdir /home/hansoft/data && \
    chown -R --from=root hansoft /home/hansoft



# define working directory
WORKDIR /opt/HansoftServer

# ./HPMServer -Install -ServerName "ExampleServer" -ServerHostname "Bigserver01" -Port 50256 -ServerAdminPassword "qwerty" -DatabaseName "Example Database" -DatabaseAdminPassword "qwerty" -ServiceName "HPServer1" -RunAsUser hansoft -RunAsGroup hansoft

# Set user right
RUN chown -R hansoft:hansoft /opt/HansoftServer


CMD ["/bin/bash", "/opt/run.sh"]

# expose Hansoft server port
EXPOSE 50256
