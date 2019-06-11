include ../Makedefs.ias
DISTDIR=../${DIST}


execs=iasClient iasEventClient iasMsgClient

sharedobjs=iasCtlInterface.so iasMsgLogger.so

all: $(sharedobjs) $(execs)

##
## executable targets
##

iasClient.o:
iasClient: iasClient.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ iasClient.o -lutl $(oralibs)

iasEventClient.o:
iasEventClient: iasEventClient.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ iasEventClient.o -lutl $(oralibs)

iasMsgClient.o:
iasMsgClient: iasMsgClient.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ iasMsgClient.o -lutl $(oralibs)

iasCtlInterface.o: 
iasCtlInterface.so: iasCtlInterface.o
	$(LD) $(extproclibs1) -o $@ iasCtlInterface.o $(extproclibs2)

iasMsgLogger.o:
iasMsgLogger.so: iasMsgLogger.o
	$(LD) $(extproclibs1) -o $@ iasMsgLogger.o $(extproclibs2)

##
## installation targets
##
tar: all
	@echo making tar in `pwd`
	@cp ${execs} ${DISTDIR}/iasClient
	@cp ${sharedobjs} ${DISTDIR}/iasClient
	@cp Makefile ${DISTDIR}/iasClient

install-common:
	@echo make install-common in `pwd`
	@cp ${execs} ${INSTALL_TARGET}/bin
	@cp ${sharedobjs} ${INSTALL_TARGET}/lib

install-gmdr: install-common

install-spectrum: install-common

install-broker: install-common

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


