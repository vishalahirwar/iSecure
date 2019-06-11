include ../Makedefs.ias
VPATH=../common
DISTDIR=../${DIST}

execs=iasStoreOutput

all: $(execs)

##
## executable targets
##
iasStoreOutput: iasStoreOutput.c
	$(CC) $(CFLAGS) -o $@ iasStoreOutput.c $(LDFLAGS) -lutl
	
##
## shared object targets
##

##
tar: all
	@echo making tar in `pwd`
	@cp ${execs} ${DISTDIR}/iasStoreOutput
	@cp Makefile ${DISTDIR}/iasStoreOutput

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
# USER=autoadmin/autoadmin@ias

.pc.o:
	@echo
	@echo Oracle is precompiling source file $<
	@echo
	${PCC} iname=$< oname=$*.tmp.c lname=$*.tmp.lst ${PCCFLAGS} user=${USER} sqlcheck=full
	${CC} -c ${CFLAGS} $*.tmp.c -o $*.o


