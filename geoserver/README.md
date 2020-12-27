# GeoServer implementation

https://assistenzstelle.inspire.gv.at/_media/netzdienste/inspire_ready_sdi_using_docker.pdf

Based on http://www.onegeology.org/service_provision/server_setup/geoserver.html#software-installation

## build


using https://github.com/oscarfonts/docker-geoserver/

(docker pull oscarfonts/geoserver)

`docker run -d -p 8080:8080 -v /etc/erml/data:/var/local/geoserver --name gs oscarfonts/geoserver`

default password : admin/geoserver