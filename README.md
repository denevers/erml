# ERML sample implementation

Example implementation of a ERML lite service

## Docker mapserver

using https://hub.docker.com/r/pdok/mapserver

`docker run -e MS_MAPFILE=/srv/data/erml.map --rm -d -p 80:80 --name ms -v ``pwd``/data:/srv/data pdok/mapserver`

Powershell


`docker run -e MS_MAPFILE=/srv/data/erml.map --rm -d -p 80:80 --name ms -v \etc\erml\data:/srv/data pdok/mapserver`


## examples

(this will work when you have a local running instance)

http://localhost/?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetMap&BBOX=50,-140,90,-50&CRS=EPSG:4326&WIDTH=905&HEIGHT=517&LAYERS=MineView&STYLES=&FORMAT=image/png&DPI=96&MAP_RESOLUTION=96&FORMAT_OPTIONS=dpi:96&TRANSPARENT=TRUE


http://localhost/?SERVICE=WFS&VERSION=2.0.0&REQUEST=GetFeature&TYPENAMES=ms:MineView&COUNT=100