kimai_1.3.1.zip:
	wget https://github.com/kimai/kimai/releases/download/1.3.1/kimai_1.3.1.zip
html: kimai_1.3.1.zip
	mkdir html
	unzip -q kimai_1.3.1.zip -d html/
	sudo chown -R www-data: html
remove_installer:
	run --rm fpm rm -r installer/
clean:
	@echo TODO implement me
