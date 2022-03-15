PREFIX := /usr/local

dependencies:
	python3 -m pip install -r requirements.txt

arch-dependencies:
	pacman -S python mpv

gentoo-dependencies:
	emerge -a dev-lang/python media-video/mpv

install: 
	mkdir -p "$(PREFIX)/bin"
	# Main library
	cp anipy_dmenu.py "$(PREFIX)/bin/anipy_dmenu.py"
	# The commands that can be run
	cp commands/anipy-dmenu.py "$(PREFIX)/bin/anipy-dmenu"
	cp commands/apd-next.py "$(PREFIX)/bin/apd-next"

uninstall:
	$(RM) "$(PREFIX)/bin/anipy-dmenu"
	$(RM) "$(PREFIX)/bin/apd-next"

all: dependencies install

.PHONY: all dependencies install uninstall
