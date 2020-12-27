FROM alpine as build

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN echo "@edge-testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk update && \
  apk --no-cache --update upgrade musl && \
  apk add --upgrade --force-overwrite apk-tools@edge && \
  apk add --update --force-overwrite wget gcc make automake libtool autoconf curl fossil git libc-dev sqlite sqlite-dev zlib-dev libxml2-dev "proj-dev@edge-testing" "geos-dev@edge-testing" "gdal-dev@edge-testing" "gdal@edge-testing" expat-dev readline-dev ncurses-dev readline ncurses-static libc6-compat && \
  rm -rf /var/cache/apk/*

ENV USER me

RUN fossil clone https://www.gaia-gis.it/fossil/freexl freexl.fossil && mkdir freexl && cd freexl && fossil open ../freexl.fossil && ./configure && make -j8 && make install

RUN git clone "https://git.osgeo.org/gitea/rttopo/librttopo.git" && cd librttopo && ./autogen.sh && ./configure && make -j8 && make install

ENV CPPFLAGS "-DACCEPT_USE_OF_DEPRECATED_PROJ_API_H"
RUN fossil clone https://www.gaia-gis.it/fossil/libspatialite libspatialite.fossil && mkdir libspatialite && cd libspatialite && fossil open ../libspatialite.fossil && ./configure --disable-dependency-tracking --enable-rttopo=yes --enable-proj=yes --enable-geos=yes --enable-gcp=yes --enable-libxml2=yes && make -j8 && make install

RUN fossil clone https://www.gaia-gis.it/fossil/readosm readosm.fossil && mkdir readosm && cd readosm && fossil open ../readosm.fossil && ./configure && make -j8 && make install

RUN fossil clone https://www.gaia-gis.it/fossil/spatialite-tools spatialite-tools.fossil && mkdir spatialite-tools && cd spatialite-tools && fossil open ../spatialite-tools.fossil && ./configure && make -j8 && make install

RUN cp /usr/local/bin/* /usr/bin/
RUN cp -R /usr/local/lib/* /usr/lib/

FROM tomcat:8.5.40-jre8-alpine
LABEL maintainer="Eric Boisvert Geological Survey of Canada eric.boisvert2@canada.ca"

# application environment stuff
ENV GS_VERSION 2.18.1
ENV GEOSERVER_DATA_DIR /opt/geoserver/data_dir

# spatialite If the libraries are not installed in a default search location like /usr/lib then the LD_LIBRARY_PATH 
# install spatialite
COPY --from=build /usr/lib/ /usr/lib
COPY --from=build /usr/bin/ /usr/bin
COPY --from=build /usr/share/proj/proj.db /usr/share/proj/proj.db

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
    wget -O /tmp/resources/geoserver.zip "https://master.dl.sourceforge.net/project/geoserver/GeoServer/${GS_VERSION}/geoserver-${GS_VERSION}-war.zip?viasf=1"  ; \
    fi; \
    unzip /tmp/resources/geoserver.zip -d /tmp/geoserver \
    && mkdir -p /usr/local/tomcat/webapps/geoserver \
    && unzip /tmp/geoserver/geoserver.war -d /usr/local/tomcat/webapps/geoserver \
    && rm -rf /usr/local/tomcat/webapps/geoserver/data \
    && rm -rf /tmp/geoserver

# get spatialite
RUN wget -O /tmp/resource/lite.zip "https://build.geoserver.org/geoserver/master/community-latest/geoserver-2.19-SNAPSHOT-gwc-sqlite-plugin.zip"  \
&& unzip /tmp/resource/lite.zip -d /usr/local/tomcat/webapps/geoserver/WEB-INF/lib



RUN rm -rf /tmp/resources

# the CMD is inherited from FROM clause
