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


http://localhost/?SERVICE=WFS&VERSION=2.0.0&REQUEST=GetFeature&TYPENAMES=ms:MineView&COUNT=2

Almost there

```xml
<?xml version='1.0' encoding="UTF-8" ?>
<wfs:FeatureCollection
   xmlns:erml="http://xmlns.earthresourceml.org/earthresourceml-lite/2.0"
   xmlns:gml="http://www.opengis.net/gml/3.2"
   xmlns:wfs="http://www.opengis.net/wfs/2.0"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xsi:schemaLocation="http://xmlns.earthresourceml.org/earthresourceml-lite/2.0 http://localhost?SERVICE=WFS&amp;VERSION=2.0.0&amp;REQUEST=DescribeFeatureType&amp;TYPENAME=erml:MineView&amp;OUTPUTFORMAT=application%2Fgml%2Bxml%3B%20version%3D3.2 http://www.opengis.net/wfs/2.0 http://schemas.opengis.net/wfs/2.0/wfs.xsd http://www.opengis.net/gml/3.2 http://schemas.opengis.net/gml/3.2.1/gml.xsd"
   timeStamp="2020-12-03T01:11:04" numberMatched="unknown" numberReturned="2"
   next="http://localhost?SERVICE=WFS&amp;VERSION=2.0.0&amp;REQUEST=GetFeature&amp;TYPENAMES=erml%3AMineView&amp;COUNT=2&amp;STARTINDEX=2">
      <wfs:boundedBy>
      	<gml:Envelope srsName="urn:ogc:def:crs:EPSG::4326">
      		<gml:lowerCorner>49.845000 -56.087000</gml:lowerCorner>
      		<gml:upperCorner>49.915000 -55.775300</gml:upperCorner>
      	</gml:Envelope>
      </wfs:boundedBy>
    <wfs:member>
      <erml:MineView gml:id="MineView.1">
        <gml:boundedBy>
        	<gml:Envelope srsName="urn:ogc:def:crs:EPSG::4326">
        		<gml:lowerCorner>49.845000 -55.775300</gml:lowerCorner>
        		<gml:upperCorner>49.845000 -55.775300</gml:upperCorner>
        	</gml:Envelope>
        </gml:boundedBy>
        <erml:msGeometry>
          <gml:Point gml:id="MineView.1.1" srsName="urn:ogc:def:crs:EPSG::4326">
            <gml:pos>49.845000 -55.775300</gml:pos>
          </gml:Point>
        </erml:msGeometry>
        <erml:identifier>1</erml:identifier>
        <erml:name>Nugget Pond</erml:name>
        <erml:status>active</erml:status>
        <erml:commodity>Base metals</erml:commodity>
        <erml:owner>Rambler Metals and Mining PLC</erml:owner>
        <erml:startDate></erml:startDate>
        <erml:endDate></erml:endDate>
        <erml:observationMethod></erml:observationMethod>
        <erml:positionalAccuracy></erml:positionalAccuracy>
        <erml:source>mms</erml:source>
        <erml:status_uri></erml:status_uri>
        <erml:representativeCommodity></erml:representativeCommodity>
        <erml:specification_uri></erml:specification_uri>
      </erml:MineView>
    </wfs:member>
    <wfs:member>
      <erml:MineView gml:id="MineView.2">
        <gml:boundedBy>
        	<gml:Envelope srsName="urn:ogc:def:crs:EPSG::4326">
        		<gml:lowerCorner>49.915000 -56.087000</gml:lowerCorner>
        		<gml:upperCorner>49.915000 -56.087000</gml:upperCorner>
        	</gml:Envelope>
        </gml:boundedBy>
        <erml:msGeometry>
          <gml:Point gml:id="MineView.2.1" srsName="urn:ogc:def:crs:EPSG::4326">
            <gml:pos>49.915000 -56.087000</gml:pos>
          </gml:Point>
        </erml:msGeometry>
        <erml:identifier>2</erml:identifier>
        <erml:name>Ming</erml:name>
        <erml:status>active</erml:status>
        <erml:commodity>Base metals</erml:commodity>
        <erml:owner>Rambler Metals and Mining PLC</erml:owner>
        <erml:startDate></erml:startDate>
        <erml:endDate></erml:endDate>
        <erml:observationMethod></erml:observationMethod>
        <erml:positionalAccuracy></erml:positionalAccuracy>
        <erml:source>mms</erml:source>
        <erml:status_uri></erml:status_uri>
        <erml:representativeCommodity></erml:representativeCommodity>
        <erml:specification_uri></erml:specification_uri>
      </erml:MineView>
    </wfs:member>
</wfs:FeatureCollection>
```
