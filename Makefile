kimai_1.1.0.zip:
	wget https://github.com/kimai/kimai/releases/download/1.1.0/kimai_1.1.0.zip
html:
	mkdir html
	unzip -q kimai_1.1.0.zip -d html/ 
	sudo chown -R www-data: html
clean:
	rm -r html
