themepurpleragedir	=	$(datadir)/themes/Booster-PURPLERAGE
ithemepurpleragedir	=	$(DESTDIR)$(themepurpleragedir)

themenvidiadir	=	$(datadir)/themes/Booster-NVIDIA
ithemenvidiadir	=	$(DESTDIR)$(themenvidiadir)

themehotroddir	=	$(datadir)/themes/Booster-HOTROD
ithemehotroddir	=	$(DESTDIR)$(themehotroddir)

install-exec-hook:

install-data-local:

if ENABLE_PURPLERAGE
	$(MKDIR_P) $(ithemepurpleragedir)
	cp -r $(srcdir)/PURPLERAGE/* $(ithemepurpleragedir)
endif # ENABLE_PURPLERAGE

if ENABLE_NVIDIA
	$(MKDIR_P) $(ithemenvidiadir)
	cp -r $(srcdir)/NVIDIA/* $(ithemenvidiadir)
endif # ENABLE_NVIDIA

if ENABLE_HOTROD
	$(MKDIR_P) $(ithemehotroddir)
	cp -r $(srcdir)/HOTROD/* $(ithemehotroddir)
endif # ENABLE_HOTROD

EXTRA_DIST = $(srcdir)/PURPLERAGE \
							$(srcdir)/NVIDIA \
							$(srcdir)/HOTROD
