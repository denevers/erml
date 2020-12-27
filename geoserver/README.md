# GeoServer implementation

Using WSL level 2 on Windows, so we can run with a Ubuntu console...

using https://github.com/oscarfonts/docker-geoserver/

`docker pull oscarfonts/geoserver`

Launch GeoServer

`docker run -d -p 8080:8080 -v ${pwd}/data:/var/local/geoserver --name gs oscarfonts/geoserver`

*Note* that we are mapping the local `/data` folder to the geoserver data folder in the container, so the files we are editing are actually on the host machine (`/data`)

GeoServer console is here http://localhost:8080/geoserver

default password for admin : admin/geoserver

