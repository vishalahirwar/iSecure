PACKAGE=ias
include Makedefs.ias
BROKERDIRS=iasSessionBroker iasSessionInterface iasMsgLogger iasManager iasClient
TRIAGEDIRS=common iasManager iasSessionServer 
##Vishal added code for Linux RHEL migration...
all:
	@echo "Making all in `$(PWD)`"
	@for i in $(SUBDIRS); do \
		echo "  Entering subdirectory $$i"; \
		( cd $$i; $(MAKE) $(MFLAGS) all ); \
		if test $$? != 0 ; then exit 1; fi ; \
		echo " "; \
	done

clean:
	@echo "Making clean in `$(PWD)`" 
	@for i in $(SUBDIRS); do \
		echo "  Entering subdirectory $$i"; \
		( cd $$i; $(MAKE) $(MFLAGS) clean ); \
		if test $$? != 0 ; then exit 1; fi ; \
		echo " "; \
	done

tar: all
	@echo "Making tar in `$(PWD)`"
	@../.scripts/mkdirs ${DIST} SUBDIRS
	@for i in $(SUBDIRS); do \
		echo "  Entering subdirectory $$i"; \
		( cd $$i; $(MAKE) $(MFLAGS) tar ); \
		if test $$? != 0 ; then exit 1; fi ; \
		echo " "; \
	done
	@cp Makedefs.ias Makefile ${DIST}

install-common:
	@echo "Making install-common in `$(PWD)`"
	@for i in $(SUBDIRS); do \
		echo "  Entering subdirectory $$i"; \
		( cd $$i; $(MAKE) $(MFLAGS) install-common); \
		if test $$? != 0 ; then exit 1; fi ; \
		echo " "; \
	done

install-gmdr: install-common
	@for i in $(SUBDIRS); do \
		echo "  Entering subdirectory $$i"; \
		( cd $$i; $(MAKE) $(MFLAGS) install-gmdr); \
		if test $$? != 0 ; then exit 1; fi ; \
		echo " "; \
	done

install-spectrum: install-common
	@echo "Making install specific for spectrum"
	@for i in $(SUBDIRS); do \
		echo "  Entering subdirectory $$i"; \
		( cd $$i; $(MAKE) $(MFLAGS) install-spectrum); \
		if test $$? != 0 ; then exit 1; fi ; \
		echo " "; \
	done

install-broker:
	@echo "Making install specific for ias broker"
	@for i in $(BROKERDIRS); do \
		echo "  Entering subdirectory $$i"; \
		( cd $$i; $(MAKE) $(MFLAGS) install-broker); \
		if test $$? != 0 ; then exit 1; fi ; \
		echo " "; \
	done

install-triage:
	@echo "Making install specific for triage"
	@for i in $(TRIAGEDIRS); do \
		echo "  Entering subdirectory $$i"; \
		( cd $$i; $(MAKE) $(MFLAGS) install-triage); \
		if test $$? != 0 ; then exit 1; fi ; \
		echo " "; \
	done

