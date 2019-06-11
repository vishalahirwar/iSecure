include ../Makedefs.ias
VPATH=../common
DISTDIR=../${DIST}

execs=iasSendServer

all: $(execs)

##
## executable targets
##

# iasEOFQueue.o: iasEOFQueue.c

iasSendServer: iasSendServer.c ../common/iasEOFQueue.o
	$(CC) $(CFLAGS) -o $@ iasSendServer.c ../common/iasEOFQueue.o $(LDFLAGS) -lutl

##
## installation targets
##
tar: all
	@echo making tar in `pwd`
	@cp ${execs} ${DISTDIR}/iasSendServer
	@cp Makefile ${DISTDIR}/iasSendServer

# install-common: $(execs)
install-common:
	@echo make install-common in `pwd`
	@cp ${execs} ${INSTALL_TARGET}/bin

install-gmdr: $(install-common)

install-spectrum: $(install-common)
	
clean:
	rm -f $(execs) *.o *.a *.so core *.tmp.c *.tmp.lst *.tar

###########################################################################
#                        Oracle specific stuff                            #
###########################################################################

.pc.o:
	@echo
	@echo Oracle is precompiling source file $<
	@echo
	${PCC} iname=$< oname=$*.tmp.c lname=$*.tmp.lst ${PCCFLAGS} user=${USER}
	${CC} -c ${CFLAGS} $*.tmp.c -o $*.o


