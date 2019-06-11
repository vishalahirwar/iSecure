include ../Makedefs.ias
SRC=..
VPATH=../common
DISTDIR=../${DIST}

execs=iasSend 

all: $(execs)


##
## executable targets
##
common:
	@( cd ../common; $(MAKE) $(MFLAGS) iasEvent.o )

iasSend_dbi.o: iasSend_dbi.pc

iasSend: common iasSend.c iasSend_dbi.o
	$(CC) $(CFLAGS) -o $@ iasSend.c iasSend_dbi.o ../common/iasEvent.o $(LDFLAGS) -lutl $(oralibs)

	
##
## shared object targets
##

##
tar: all
	@echo making tar in `pwd`
	@cp ${execs} ${DISTDIR}/iasSend
	@cp Makefile ${DISTDIR}/iasSend

# install-common: $(execs)
install-common:
	@echo make install-common in `pwd`
	@cp ${execs} ${INSTALL_TARGET}/bin

install-gmdr: install-common

install-spectrum: install-common
	
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


