all:
	

install:
	mkdir ~/.emacs.d
	cp --recursive config-* ~/.emacs.d
	cp --recursive vendor ~/.emacs.d
	cp .emacs ~/

install-vendor:
	bower install

clean:
	rm -rf ~/.emacs.d
	rm -rf ~/.emacs

clean-vendor:
	rm -rf vendor
