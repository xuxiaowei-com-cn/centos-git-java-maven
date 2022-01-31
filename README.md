# centos-git-java-maven

包含 CentOS、git、Java、Maven 的 Docker

- 创建容器

```
docker run \
--restart=always \
-itd \
--privileged=true \
--name centos-git-java-maven_0.0.2 \
-p 1001:1001 \
-v /home/data/centos-git-java-maven/:/home \
centos-git-java-maven:0.0.2
```

- 进入容器

```
docker exec -it centos-git-java-maven_0.0.2 bash
```

- 测试容器

```
java -version
mvn -version
git --version
```
