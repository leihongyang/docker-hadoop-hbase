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
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
wget http://mirrors.hust.edu.cn/apache/hbase/2.0.2/hbase-2.0.2-bin.tar.gz && tar -xzf hbase-2.0.2-bin.tar.gz && \
wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz && tar -xzf jdk-8u181-linux-x64.tar.gz && \
mv hbase-2.0.2 /usr/local/hbase-2.0.2 && mv jdk1.8.0_181 /usr/local/jdk1.8.0_181 && \
rm *.tar.gz

ENV JAVA_HOME /usr/local/jdk1.8.0_181
ENV HBASE_HOME /usr/local/hbase-2.0.2
ENV PATH ${HBASE_HOME}/bin:$JAVA_HOME/bin:$PATH

COPY config/* /tmp/

RUN mv /tmp/hbase-env.sh $HBASE_HOME/conf/hbase-env.sh && \
    mv /tmp/hbase-site.xml $HBASE_HOME/conf/hbase-site.xml && \
    mv /tmp/regionservers $HBASE_HOME/conf/regionservers && \
    mv /tmp/start-hbase.sh /root/ && \
    mv /tmp/ssh_config ~/.ssh/config

CMD ["/root/start-hbase.sh"]
