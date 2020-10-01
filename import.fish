#!/usr/bin/env fish

source source.fish

for xml in $DIR_INCOMING/*.xml
	set filename (basename $xml)
	set rootname (echo $filename | sed 's/\.[^.]*$//')
	saxon -s:$xml -xsl:transform/nicefood.xsl -o:$DIR_TEMP/$rootname.html
	saxon -s:$xml -xsl:transform/ngm.xsl -o:$DIR_NGM/$rootname.html
	wkhtmltopdf -B 10mm -T 5mm --header-spacing 5 --footer-center "[page] oldal" --footer-font-size 8 $DIR_TEMP/$rootname.html $DIR_PDF/$rootname.pdf
	mv $xml $DIR_XML/$filename
 end