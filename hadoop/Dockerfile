FROM ubuntu:16.04

WORKDIR /root

# install openssh-server
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

# install hadoop 2.7.2
ADD hadoop-3.1.1.tar.gz /usr/local/
ADD jdk-8u181-linux-x64.tar.gz /usr/local/

ENV JAVA_HOME /usr/local/jdk1.8.0_181
ENV HADOOP_HOME=/usr/local/hadoop-3.1.1 
ENV PATH=$PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin 

COPY config/* /tmp/

RUN mkdir -p ~/hdfs/namenode && \ 
    mkdir -p ~/hdfs/datanode && \
    mkdir $HADOOP_HOME/logs && \
    mv /tmp/ssh_config ~/.ssh/config && \
    mv /tmp/hadoop-env.sh $HADOOP_HOME/etc/hadoop/hadoop-env.sh && \
    mv /tmp/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml && \ 
    mv /tmp/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml && \
    mv /tmp/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml && \
    mv /tmp/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml && \
    mv /tmp/slaves $HADOOP_HOME/etc/hadoop/workers && \
    mv /tmp/start-hadoop.sh ~/start-hadoop.sh && \
    chmod +x ~/start-hadoop.sh && \
    chmod +x ~/run-wordcount.sh && \
    chmod +x $HADOOP_HOME/sbin/start-dfs.sh && \
    chmod +x $HADOOP_HOME/sbin/start-yarn.sh && \
    sed -i '2i YARN_RESOURCEMANAGER_USER=root\nHADOOP_SECURE_DN_USER=yarn\nYARN_NODEMANAGER_USER=root' $HADOOP_HOME/sbin/*-yarn.sh && \
    sed -i '2i HDFS_DATANODE_USER=root\nHADOOP_SECURE_DN_USER=hdfs\nHDFS_NAMENODE_USER=root\nHDFS_SECONDARYNAMENODE_USER=root' $HADOOP_HOME/sbin/*-dfs.sh && \
    $HADOOP_HOME/bin/hdfs namenode -format

CMD [ "sh", "-c", "service ssh start; bash"]
