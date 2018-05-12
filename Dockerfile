#下载python3镜像
FROM daocloud.io/python:3-onbuild
#设置镜像的维护者，相当于镜像的作者或发行方。
MAINTAINER Captain Dao <support@daocloud.io>
#在容器递归创建/app目录
RUN mkdir -p /app
WORKDIR /app
#把文件的req添加到容器中
ADD requirements.txt requirements.txt
#在容器中运行，添加依赖
RUN pip install -r requirements.txt
#add和copy差不多，不过add添加的压缩包可以自动解压，更牛逼
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 8888
#开启容器时运行，自动开启jupyter脚本
ENTRYPOINT ["docker-entrypoint.sh"]
CMD [""]
