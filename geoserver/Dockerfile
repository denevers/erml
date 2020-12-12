FROM tomcat:8.5.40-jre8-alpine
LABEL maintainer="Eric Boisvert Geological Survey of Canada eric.boisvert2@canada.ca"

# application environment stuff
ENV GS_VERSION 2.11.2
ENV GEOSERVER_DATA_DIR /opt/geoserver/data_dir

RUN mkdir -p $GEOSERVER_DATA_DIR
RUN mkdir -p /tmp/resources 
RUN mkdir -p /tmp/geoserver

#RUN mkdir -p /etc/ssl/certs/ && update-ca-certificates --fresh

#install certificates
 RUN   apk update \                                                                                                                                                                                                                        
  &&   apk add ca-certificates wget \                                                                                                                                                                                                      
  &&   update-ca-certificates    

# install GeoServer


# https://sourceforge.net/projects/geoserver/files/GeoServer/2.11.2/geoserver-2.11.2-war.zip/download
# https://master.dl.sourceforge.net/project/geoserver/GeoServer/2.11.2/geoserver-2.11.2-war.zip?viasf=1
RUN if [ ! -f /tmp/resources/geoserver.zip ]; then \
    wget -O /tmp/resources/geoserver.zip "https://master.dl.sourceforge.net/project/geoserver/GeoServer/2.11.2/geoserver-2.11.2-war.zip?viasf=1"  ; \
    fi; \
    unzip /tmp/resources/geoserver.zip -d /tmp/geoserver \
    && mkdir -p /usr/local/tomcat/webapps/geoserver \
    && unzip /tmp/geoserver/geoserver.war -d /usr/local/tomcat/webapps/geoserver \
    && rm -rf /usr/local/tomcat/webapps/geoserver/data \
    && rm -rf /tmp/geoserver

RUN rm -rf /tmp/resources

# the CMD is inherited from FROM clause
