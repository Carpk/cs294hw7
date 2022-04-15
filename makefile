


image:
	URL=`(awk -F'"' '/alt="" class="pull-left"/ { print "https://forecast.weather.gov/"$$2 }' /tmp/weatherdata)`; curl $$URL --output image.jpg


report.tex: image
	export CURRTEMP=`(awk -F'>|&' '/class="myforecast-current-lrg"/ { print $$2}' /tmp/weatherdata)`; envsubst < report.tmpl > report.tex
	


report.pdf: report.tex
	pdflatex report.tex

clean:
	rm image.jpg report.aux report.log report.tex