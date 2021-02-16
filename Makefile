

.PHONY: install uninstall

all: install

install:
	sudo ln -s "$(CURDIR)/toclip" /usr/local/bin/toclip
	sudo ln -s "$(CURDIR)/toclip" /usr/local/bin/toclipt

uninstall:
	sudo rm /usr/local/bin/toclip
	sudo rm /usr/local/bin/toclipt
