FROM ubuntu:16.04

WORKDIR /root

RUN echo "Asia/Shanghai" > /etc/timezone && \
mkdir -p /etc/sudoers.d && \
cd /etc/sudoers.d/ && \
touch nopasswdsudo && \
echo "hadoop ALL=(ALL) NOPASSWD : ALL" >> nopasswdsudo && \
apt-get update && \
apt-get install -y openssh-server openssh-client vim && \
rm -rf /var/lib/apt/lists/* && \
addgroup hadoop && \
useradd -m hadoop -g hadoop -p hadoop && \
mkdir /var/run/sshd && \
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

ADD jdk-8u181-linux-x64.tar.gz /usr/local/
ENV JAVA_HOME /usr/local/jdk1.8.0_181

ADD hbase-2.0.2-bin.tar.gz /usr/local/
ENV HBASE_HOME /usr/local/hbase-2.0.2
ENV PATH ${HBASE_HOME}/bin:$JAVA_HOME/bin:$PATH

COPY config/* /tmp/

RUN mv /tmp/hbase-env.sh $HBASE_HOME/conf/hbase-env.sh && \
    mv /tmp/hbase-site.xml $HBASE_HOME/conf/hbase-site.xml && \
    mv /tmp/regionservers $HBASE_HOME/conf/regionservers && \
    mv /tmp/start-hbase.sh /root/
    service ssh start

#CMD [ "sh", "-c", "service ssh start; bash"]
