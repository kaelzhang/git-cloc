PREFIX ?= /usr/local
MANPREFIX ?= "$(PREFIX)/share/man/man1"

install:
	@mkdir -p $(DESTDIR)$(MANPREFIX)
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	
	@echo "... installing bins to $(DESTDIR)$(PREFIX)/bin"
	cp -f bin/git-cloc $(DESTDIR)$(PREFIX)/bin
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/git-cloc

	@echo "... installing man pages to $(DESTDIR)$(MANPREFIX)"
	cp -f man/git-cloc.1 $(DESTDIR)$(MANPREFIX)


uninstall:
	@echo "... installing bins to $(DESTDIR)$(PREFIX)/bin"
	rm -f $(DESTDIR)$(PREFIX)/bin/git-cloc

	@echo "... installing man pages to $(DESTDIR)$(MANPREFIX)"
	rm -f $(DESTDIR)$(MANPREFIX)/git-cloc.1