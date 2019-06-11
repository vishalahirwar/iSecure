include ../Makedefs.ias
SRC=..
DISTDIR=../${DIST}

utlobjs=utlDaemon.o utlError.o utlMsgLog.o utlSocket.o utlSpp.o utlSema4.o \
	utlLink.o utlMisc.o utlConfig.o $(utlProcessInfo).o utlBox.o \
	utlOracle.o utlEncrypt.o

# sharedobjs=libums.so
sharedobjs=

staticlibs=libutl.a

execs=iasQuerySendShm sppFileXferSend

all: $(execs) umsSessionInterface.o iasEvent.o iasEOFQueue.o $(staticlibs)

utlDaemon.o: utlDaemon.c
utlError.o:  utlError.c
utlMsgLog.o: utlMsgLog.c
utlSocket.o: utlSocket.c
utlSpp.o:    utlSpp.c
utlSema4.o:  utlSema4.c
utlLink.o:   utlLink.c
utlMisc.o:   utlMisc.c
utlConfig.o: utlConfig.c
utlEncrypt.o: utlEncrypt.c
$(utlProcessInfo).o: $(utlProcessInfo).c
utlBox.o:    utlBox.c
utlOracle.o: utlOracle.pc
iasEOFQueue.o: iasEOFQueue.c
iasEvent.o: iasEvent.c iasEvent.h

##
## executable targets
##
sppFileXferRecv.o: sppFileXferRecv.c
sppFileXferRecv: sppFileXferRecv.o libutl.a
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ sppFileXferRecv.o -lutl -lsocket -lnsl

##
## shared object targets
##
umsMsgLogger.o: utlMsgLog.o
umsMsgLogger.so: umsMsgLogger.o
	$(LD) $(extproclibs1) -o $@ umsMsgLogger.o $(extproclibs2)

umsSessionInterface.o: $(umsSessionIncs)
umsSessionInterface.so: umsSessionInterface.o
	$(LD) $(extproclibs1) -o $@ umsSessionInterface.o $(extproclibs2)

libums.so: sndpage.c sndmail.c getnothost.c
	$(CC) $(CFLAGS) $(SOFLAGS) sndpage.c sndmail.c getnothost.c -o $@

libutl.a: $(utlobjs)
	ar r $@ $?

iasQuerySendShm: iasQuerySendShm.c libutl.a
		$(CC) $(CFLAGS) -o $@ iasQuerySendShm.c $(LDFLAGS) -lutl

sppFileXferSend: sppFileXferSend.c libutl.a
		 $(CC) $(CFLAGS) -o $@ sppFileXferSend.c $(LDFLAGS) -lutl

##
## installation targets
##
tar: all
	@echo making tar in `pwd`
	@cp ${execs} ${DISTDIR}/common
	@cp ${staticlibs} ${DISTDIR}/common
	@cp Makefile ${DISTDIR}/common

# install-common: $(execs) umsSessionInterface.o iasEvent.o iasEOFQueue.o $(staticlibs)
install-common:
	@echo make install-common in `pwd`
	@cp ${execs} ${INSTALL_TARGET}/bin
	@cp ${staticlibs} ${INSTALL_TARGET}/lib

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


