#Compiler
CC=gcc
CFLAGS=-Wall -Wextra -Werror

all: colleen grace sully


#Colleen
COLLEEN_NAME=Colleen
COLLEEN_SRC=Colleen.c
COLLEEN_TMP=tmp_Colleen

colleen: ${COLLEEN_NAME}

${COLLEEN_NAME}: ${COLLEEN_SRC}
	${CC} ${CFLAGS} -o ${COLLEEN_NAME} ${COLLEEN_SRC}

colleen_test: colleen
	./${COLLEEN_NAME} > tmp_Colleen
	diff tmp_Colleen ${COLLEEN_SRC}

colleen_clean:
	rm -f ${COLLEEN_NAME} ${COLLEEN_TMP}


#Grace
GRACE_NAME=Grace
GRACE_SRC=Grace.c
GRACE_OUT=Grace_kid.c

grace: ${GRACE_NAME}

${GRACE_NAME}: ${GRACE_SRC}
	${CC} ${CFLAGS} -o ${GRACE_NAME} ${GRACE_SRC}

grace_test: grace
	./${GRACE_NAME}
	diff ${GRACE_SRC} ${GRACE_OUT}

grace_clean:
	rm -f ${GRACE_NAME} ${GRACE_OUT}


#Sully
SULLY_NAME=Sully
SULLY_SRC=Sully.c
SULLY_OUT=Sully_*
SULLY_LAST_SRC=Sully_0.c

sully: ${SULLY_NAME}

${SULLY_NAME}: ${SULLY_SRC}
	${CC} ${CFLAGS} -o ${SULLY_NAME} ${SULLY_SRC}

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