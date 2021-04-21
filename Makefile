

.PHONY: install uninstall

all: install

install:
	install -m 0755 -D "$(CURDIR)/toclip" /usr/local/bin/toclip
	install -m 0755 -D "$(CURDIR)/toclip" /usr/local/bin/toclipt

uninstall:
	rm /usr/local/bin/toclip
	rm /usr/local/bin/toclipt
