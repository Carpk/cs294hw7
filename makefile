
image:
	curl https://forecast.weather.gov/newimages/large/wind_bkn.png --output image.jpg

report.tex:
	envsubst

report.pdf:
	pdflatex


