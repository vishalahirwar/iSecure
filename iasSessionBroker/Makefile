include ../Makedefs.ias
SRC=..
VPATH=../common:../iasSessionInterface:../include
DISTDIR=../${DIST}
USER=triage/triage@ias

execs=iasSessionBroker

all: $(execs)


##
## executable targets
##

iasSessionBroker.o: iasSessionBroker.pc iasSessionBroker.h

iasSessionInterface.o: iasSessionInterface.c iasSessionBroker.h

iasSessionBroker: iasSessionBroker.o iasSessionInterface.o
	$(CC) $(CFLAGS) -o $@ iasSessionBroker.o iasSessionInterface.o $(LDFLAGS) -lutl $(oralibs)

	
##
## shared object targets
##

##
tar: all
	@echo making tar in `pwd`
	@cp ${execs} ${DISTDIR}/iasSessionBroker
	@cp Makefile ${DISTDIR}/iasSessionBroker

install-common:
	@echo "nothing to install"

install-gmdr: install-common

install-spectrum: install-common

install-broker: $(install-common)
	@echo make install broker in `pwd`
	@cp ${execs} ${INSTALL_TARGET}/bin

clean:
	rm -f $(execs) *.o *.a *.so core *.tmp.c *.tmp.lst *.tar

###########################################################################
#                        Oracle specific stuff                            #
###########################################################################

.pc.o:
	@echo
	@echo Oracle is precompiling source file $<
	@echo
	${PCC} iname=$< oname=$*.tmp.c lname=$*.tmp.lst ${PCCFLAGS} user=${USER} sqlcheck=full
	${CC} -c ${CFLAGS} $*.tmp.c -o $*.o


