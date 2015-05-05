all: css js xsl jquery treeview bootstrap

css js xsl:
	mkdir -p $@

js/jquery-1.4.3.min.js: js
	curl -Jl -o $@ http://code.jquery.com/jquery-1.4.3.min.js

js/jquery.cookie.js js/jquery.treeview.js css/jquery.treeview.lib.css: js
	echo TODO: deploy $@ of jQuery treeview plugin


bootstrap-1.4.0.zip:
	curl -JLO https://github.com/twbs/bootstrap/archive/v1.4.0.zip
	-mv v1.4.0.zip $@
	
bootstrap-1.4.0: bootstrap-1.4.0.zip
	unzip bootstrap-1.4.0.zip

css/bootstrap.css js/bootstrap.js: bootstrap-1.4.0 js css
	patch -p1 -d bootstrap-1.4.0 -ubi ../bootstrap-1.4.0.patch
	make -C bootstrap-1.4.0
	cp -av bootstrap-1.4.0/bootstrap.css css/
	cat \
		bootstrap-1.4.0/js/bootstrap-alerts.js \
		bootstrap-1.4.0/js/bootstrap-dropdown.js \
		bootstrap-1.4.0/js/bootstrap-popover.js	\
		bootstrap-1.4.0/js/bootstrap-tabs.js \
		bootstrap-1.4.0/js/bootstrap-buttons.js \
		bootstrap-1.4.0/js/bootstrap-modal.js \
		bootstrap-1.4.0/js/bootstrap-scrollspy.js \
		bootstrap-1.4.0/js/bootstrap-twipsy.js \
		> js/bootstrap.js
	rm -rf bootstrap-1.4.0 bootstrap-1.4.0.zip

.PHONY : jquery treeview bootstrap

jquery : js/jquery-1.4.3.min.js
treeview : js/jquery.cookie.js js/jquery.treeview.js css/jquery.treeview.lib.css
bootstrap : css/bootstrap.css js/bootstrap.js
