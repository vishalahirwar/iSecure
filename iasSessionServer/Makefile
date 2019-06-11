include ../Makedefs.ias
SRC=..
VPATH=../common
DISTDIR=../${DIST}

execs=iasSessionServer

all: $(execs)


##
## executable targets
##

iasSessionServer.o: iasSessionServer.c

iasSessionServer: iasSessionServer.o
	$(CC) $(CFLAGS) -o $@ iasSessionServer.o $(LDFLAGS) -lutl $(oralibs)

	
##
## shared object targets
##

##
tar: all
	@echo making tar in `pwd`
	@cp ${execs} ${DISTDIR}/iasSessionServer
	@cp Makefile ${DISTDIR}/iasSessionServer

# install-common: $(execs)
install-common:
	@echo make install-common in `pwd`
	@cp ${execs} ${INSTALL_TARGET}/bin

install-gmdr: install-common

install-spectrum: install-common
	
clean:
	rm -f $(execs) *.o *.a *.so core *.tmp.c *.tmp.lst *.tar

