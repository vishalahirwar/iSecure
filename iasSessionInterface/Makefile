include ../Makedefs.ias
SRC=..
VPATH=../common:../include
DISTDIR=../${DIST}
USER=triage/triage@ias

shared=iasSessionInterface.so

all: $(shared)


##
## shared targets
##

iasSessionInterface.o: iasSessionInterface.c iasSessionBroker.h

iasSessionInterface.so: iasSessionInterface.o
	$(LD) $(extproclibs1) -o $@ iasSessionInterface.o $(extproclibs2)
	
tar: all
	@echo making tar in `pwd`
	@cp ${shared} ${DISTDIR}/iasSessionInterface
	@cp Makefile ${DISTDIR}/iasSessionInterface

# install-common: $(shared)
install-common:

install-gmdr: install-common

install-spectrum: install-common

install-broker: install-common
	@echo make install broker in `pwd`
	@cp ${shared} ${INSTALL_TARGET}/lib
	
clean:
	rm -f $(shared) *.o *.a *.so core *.tmp.c *.tmp.lst *.tar

###########################################################################
#                        Oracle specific stuff                            #
###########################################################################

.pc.o:
	@echo
	@echo Oracle is precompiling source file $<
	@echo
	${PCC} iname=$< oname=$*.tmp.c lname=$*.tmp.lst ${PCCFLAGS} user=${USER} sqlcheck=full
	${CC} -c ${CFLAGS} $*.tmp.c -o $*.o


