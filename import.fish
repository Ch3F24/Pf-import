for xml in $DIR_XML*.xml
	set filename (basename $xml)
	set rootname (echo $filename | sed 's/\.[^.]*$//')
	saxon -s:$xml -xsl:transform/nicefood.xsl -o:$DIR_TEMP/$rootname.html
	saxon -s:$xml -xsl:transform/ngm.xsl -o:$DIR_TEMP/$rootname.html
	wkhtmltopdf -B 10mm -T 5mm --header-spacing 5 --footer-center "[page] oldal" --footer-font-size 8 $DIR_TEMP/$rootname.html $DIR_PDF/$rootname.pdf
 end