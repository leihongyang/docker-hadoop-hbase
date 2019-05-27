# docker-hadoop-hbase

# 1.将根目录中的build image文件中复制jdk那一行的注释去掉，如果需要的话，否则构建两个镜像会分别拉取jdk
# 2.dockerfile中jdk拉取路径可能会有问题，因为oracle官方有个校验码，此时手动去官方查一下即可。
# 3.直接运行根目录的build会构建hadoop和hbase两个镜像。也可以进入对应目录分别构建。
