# GeoServer implementation

https://assistenzstelle.inspire.gv.at/_media/netzdienste/inspire_ready_sdi_using_docker.pdf

Based on http://www.onegeology.org/service_provision/server_setup/geoserver.html#software-installation

## build

`docker build -t tgi/geoserver .`

this will take a bit of time because it downloads geoserver from sourceforge

docker run -i tgi/geoserver /bin/bash

## execution 

`docker run --rm -d -p 80:80 --name ms -v \etc\erml\data:/opt/geoserver/data_dir tgi/geoserver`

 /opt/geoserver/data_dir