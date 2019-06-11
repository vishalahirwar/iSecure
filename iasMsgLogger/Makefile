include ../Makedefs.ias
SRC=..
VPATH=../common
DISTDIR=../${DIST}

shared=iasMsgLogger.so

all: $(shared)


##
## executable targets
##

iasMsgLogger.o: iasMsgLogger.c

iasMsgLogger.so: iasMsgLogger.o
	$(LD) $(extproclibs1) -o $@ iasMsgLogger.o $(extproclibs2)

	
##
## shared object targets
##

##
tar: all
	@echo making tar in `pwd`
	@cp ${shared} ${DISTDIR}/iasMsgLogger
	@cp Makefile ${DISTDIR}/iasMsgLogger

install-common:

install-gmdr: install-common

install-spectrum: install-common

install-broker: install-common
	@echo make install-broker in `pwd`
	@cp ${shared} ${INSTALL_TARGET}/lib
	
clean:
	rm -f $(shared) *.o *.a *.so core *.tmp.c *.tmp.lst *.tar

