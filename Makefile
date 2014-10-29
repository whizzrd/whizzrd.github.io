all : css js xsl jquery treeview bootstrap

css js xsl :
	mkdir -p $@

js/jquery-1.4.3.min.js :
	echo TODO: deploy $@ of jQuery

js/jquery.cookie.js js/jquery.treeview.js css/jquery.treeview.lib.css :
	echo TODO: deploy $@ of jQuery treeview plugin

css/bootstrap.css js/bootstrap.js :
	echo TODO: deploy $@ of Bootstrap 140

.PHONY : jquery treeview bootstrap

jquery : js/jquery-1.4.3.min.js
treeview : js/jquery.cookie.js js/jquery.treeview.js css/jquery.treeview.lib.css
bootstrap : css/bootstrap.css js/bootstrap.js
