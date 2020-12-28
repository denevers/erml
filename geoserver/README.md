# GeoServer implementation

Using WSL level 2 on Windows, so we can run with a Ubuntu console...

using https://github.com/oscarfonts/docker-geoserver/

`docker pull oscarfonts/geoserver`

Launch GeoServer (we assume you are at the root of this repo)

`docker run -d -p 8080:8080 -v /mnt/c/etc/erml/data:/var/local/geoserver -v /mnt/c/etc/erml/ext:/var/local/geoserver-exts/ --name gs oscarfonts/geoserver`

*Note* that we are mapping the local `/data` folder to the geoserver data folder in the container, so the files we are editing are actually on the host machine (`/data`)

GeoServer console is here http://localhost:8080/geoserver

default password for admin : admin/geoserver

## Database

You might have to edit this part of the document 

erml_MineView.xml 

```xml
		<DataStore>
			<id>datastore</id>
			<parameters>
				<Parameter><name>dbtype</name><value>postgis</value></Parameter>
				<Parameter><name>host</name><value>192.168.0.110</value></Parameter>
				<Parameter><name>port</name><value>5432</value></Parameter>
				<Parameter><name>database</name><value>wheeler</value></Parameter>
				<Parameter><name>user</name><value>erml</value></Parameter>
				<Parameter><name>passwd</name><value>?erml?</value></Parameter>
				<Parameter><name>schema</name><value>erml</value></Parameter>
				<Parameter><name>Expose primary keys</name><value>true</value></Parameter>
			</parameters>
        </DataStore>
```


## Mapping 



Table in the database

![alt text](../img/mine_view.png "mine_view")

to be transformed into ERML-lite instance (https://earthresourceml.org/earthresourceml-lite/2.0.1/examples/MineView_v2.0.1.xml)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<erl:MineView     
    xmlns:erl="http://xmlns.earthresourceml.org/earthresourceml-lite/2.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:gml="http://www.opengis.net/gml/3.2"
    xsi:schemaLocation="http://xmlns.earthresourceml.org/earthresourceml-lite/2.0 http://schemas.earthresourceml.org/earthresourceml-lite/2.0/erml-lite.xsd"
    gml:id="test_v2.0.1">
    <gml:identifier codeSpace="www.ga.gov.au">http://data.geoscience.gov.au/feature/ga/MineView/ga.MineView.123456</gml:identifier>
    <erl:identifier>http://data.geoscience.gov.au/feature/ga/MineView/ga.MineView.123456</erl:identifier>
    <erl:name>Lassiters</erl:name>
    <erl:status>operating</erl:status>
    <erl:commodity>gold, copper, silver</erl:commodity>
    <erl:owner>BHP Billiton</erl:owner>
    <erl:startDate>1978-01-01</erl:startDate>
    <erl:endDate>2009-01-01</erl:endDate>
    <erl:observationMethod>surveyed</erl:observationMethod>
    <erl:positionalAccuracy>0.5 metres</erl:positionalAccuracy>
    <erl:source>BHP Billiton Pty Ltd annual report, 2010</erl:source>
    <erl:status_uri>http://resource.geosciml.org/classifier/cgi/mine-status/operating</erl:status_uri>
    <erl:representativeCommodity_uri>http://resource.geosciml.org/classifier/cgi/commodity-code/precious-metal</erl:representativeCommodity_uri>
    <erl:specification_uri>http://data.geoscience.gov.au/feature/ga/mine/ga.mine.123456</erl:specification_uri>
    <erl:shape>
        <gml:Point srsName="epsg:4283" srsDimension="2" gml:id="GA.mineView.123456.point">          
            <gml:pos>138.234 -26.747467</gml:pos>
        </gml:Point>
    </erl:shape>
</erl:MineView>
```

test : http://localhost:8080/geoserver/erml/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=erml%3Amine_view&maxFeatures=50
