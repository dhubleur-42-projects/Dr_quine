NODE=node

all: test

#Colleen
COLLEEN_SRC=Colleen.js
COLLEEN_TMP=tmp_Colleen

colleen_test:
	${NODE} ${COLLEEN_SRC} > tmp_Colleen
	diff tmp_Colleen ${COLLEEN_SRC}

colleen_clean:
	rm -f ${COLLEEN_NAME} ${COLLEEN_TMP}


#Grace
GRACE_SRC=Grace.js
GRACE_OUT=Grace_kid.js

grace_test:
	${NODE} ${GRACE_SRC}
	diff ${GRACE_SRC} ${GRACE_OUT}

grace_clean:
	rm -f ${GRACE_NAME} ${GRACE_OUT}


#Sully
SULLY_SRC=Sully.js
SULLY_OUT=Sully_*
SULLY_LAST_SRC=Sully_0.js

sully_test:
	${NODE} ${SULLY_SRC}
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