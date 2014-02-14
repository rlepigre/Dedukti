
# PLEASE EDIT THE FOLLOWING LINES TO FIT YOUR SYSTEM CONFIGURATION

INSTALL_DIR=/usr/bin

# DO NOT EDIT AFTER THIS LINE

OPTIONS = -cflags -inline,10 -ocamlc 'ocamlopt -rectypes' -cflags -rectypes \
	 -use-menhir -menhir "menhir --external-tokens Types"

all: dkcheck dktop dkdep

dkcheck:
	ocamlbuild -build-dir _dkcheck $(OPTIONS) dkcheck.native

dktop:
	ocamlbuild -build-dir _dktop $(OPTIONS) dktop.native

dkdep:
	ocamlbuild -build-dir _dkdep $(OPTIONS) dkdep.native

dk2mmt:
	ocamlbuild -build-dir _dk2mmt  $(OPTIONS) dk2mmt.native

profile:
	ocamlbuild -tag profile -build-dir  $(OPTIONS) _dkcheck dkchech.native

install:
	install _dkcheck/dkcheck.native ${INSTALL_DIR}/dkcheck
	install _dktop/dktop.native ${INSTALL_DIR}/dktop
	install _dkdep/dkdep.native ${INSTALL_DIR}/dkdep

clean:
	ocamlbuild -build-dir _dkcheck -clean
	ocamlbuild -build-dir _dktop -clean
	ocamlbuild -build-dir _dkdep -clean
