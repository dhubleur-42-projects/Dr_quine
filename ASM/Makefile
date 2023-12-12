#Compiler
COMPILER= nasm
COMPILER_FLAGS= -f elf64

LINKER= ld
LINKER_FLAGS= -dynamic-linker /lib64/ld-linux-x86-64.so.2 

all: colleen grace sully

%.o: %.s
	${COMPILER} ${COMPILER_FLAGS} -o $@ $<

#Colleen
COLLEEN_NAME=Colleen
COLLEEN_SRC=Colleen.s
COLLEEN_TMP=tmp_Colleen

colleen: ${COLLEEN_NAME}

${COLLEEN_NAME}: ${COLLEEN_SRC:.s=.o}
	${LINKER} ${LINKER_FLAGS} -o ${COLLEEN_NAME} -lc ${COLLEEN_SRC:.s=.o}

colleen_test: colleen
	./${COLLEEN_NAME} > tmp_Colleen
	diff tmp_Colleen ${COLLEEN_SRC}

colleen_clean:
	rm -f ${COLLEEN_NAME} ${COLLEEN_TMP} ${COLLEEN_SRC:.s=.o}


#Grace
GRACE_NAME=Grace
GRACE_SRC=Grace.s
GRACE_OUT=Grace_kid.s

grace: ${GRACE_NAME}

${GRACE_NAME}: ${GRACE_SRC:.s=.o}
	${LINKER} ${LINKER_FLAGS} -o ${GRACE_NAME} -lc ${GRACE_SRC:.s=.o}

grace_test: grace
	./${GRACE_NAME}
	diff ${GRACE_SRC} ${GRACE_OUT}

grace_clean:
	rm -f ${GRACE_NAME} ${GRACE_OUT} ${GRACE_SRC:.s=.o}


#Sully
SULLY_NAME=Sully
SULLY_SRC=Sully.c
SULLY_OUT=Sully_*
SULLY_LAST_SRC=Sully_0.c

sully: ${SULLY_NAME}

${SULLY_NAME}: ${SULLY_SRC}
	${LINKER} ${LINKER_FLAGS} -o ${SULLY_NAME} -lc ${SULLY_SRC}

sully_test: sully
	./${SULLY_NAME}
	diff ${SULLY_SRC} ${SULLY_LAST_SRC} || true

sully_clean:
	rm -f ${SULLY_NAME} ${SULLY_OUT}


#General
clean: colleen_clean grace_clean sully_clean
re: clean all

test:
	@echo "===== Colleen ====="
	make colleen_test
	@echo "===== Grace ====="
	make grace_test
	@echo "===== Sully ====="
	make sully_test
	make clean

.PHONY: colleen colleen_test colleen_clean grace grace_test grace_clean sully sully_test sully_clean clean re test