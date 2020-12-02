# ERML sample implementation

Example implementation of a ERML lite service

## Docker mapserver

using https://hub.docker.com/r/pdok/mapserver

`docker run -e MS_MAPFILE=/srv/data/erml.map --rm -d -p 80:80 --name ms -v ``pwd``/data:/srv/data pdok/mapserver`

Powershell


`docker run -e MS_MAPFILE=/srv/data/erml.map --rm -d -p 80:80 --name ms -v \etc\erml\data:/srv/data pdok/mapserver`


## examples

http://localhost/?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetMap&BBOX=50,-140,90,-50&CRS=EPSG:4326&WIDTH=905&HEIGHT=517&LAYERS=MineView&STYLES=&FORMAT=image/png&DPI=96&MAP_RESOLUTION=96&FORMAT_OPTIONS=dpi:96&TRANSPARENT=TRUE
