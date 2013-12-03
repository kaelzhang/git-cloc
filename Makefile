PREFIX ?= /usr/local
MANPREFIX ?= "$(PREFIX)/share/man/man1"

install:
	@mkdir -p $(DESTDIR)$(MANPREFIX)
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	
	@echo "... installing bins to $(DESTDIR)$(PREFIX)/bin"
	cp -f bin/git-cloc.sh $(DESTDIR)$(PREFIX)/bin/git-cloc
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/git-cloc

	@echo "... installing man pages to $(DESTDIR)$(MANPREFIX)"
	cp -f man/git-cloc.1 $(DESTDIR)$(MANPREFIX)


uninstall:
	@echo "... uninstalling bins"
	rm -f $(DESTDIR)$(PREFIX)/bin/git-cloc

	@echo "... uninstalling man pages"
	rm -f $(DESTDIR)$(MANPREFIX)/git-cloc.1