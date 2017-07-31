FROM microsoft/dotnet:1.0.1-runtime

#download mycat-ef-proxy
RUN mkdir -p /usr/local/proxy && mkdir -p /usr/local/mycat/conf
ADD https://github.com/LonghronShen/mycat-docker/releases/download/1.6/MyCat-Entity-Framework-Core-Proxy.1.0.0-alpha2-netcore100.tar.gz /usr/local/proxy
RUN cd /usr/local/proxy && tar -zxvf MyCat-Entity-Framework-Core-Proxy.1.0.0-alpha2-netcore100.tar.gz && ls -lna && sed -i -e 's#C:\\\\mycat#/usr/local/mycat#g' config.json

VOLUME /usr/local/mycat/conf

EXPOSE 7066

WORKDIR /usr/local/proxy

ENTRYPOINT ["dotnet", "Pomelo.EntityFrameworkCore.MyCat.Proxy.dll"]
