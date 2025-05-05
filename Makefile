include Makefile.inc

SRC=.

all: main.x

./sparallelmethod.intfb.ok: $(SRC)/./sparallelmethod.intfb.h 
	touch ./sparallelmethod.intfb.ok

bbt.o: $(SRC)/bbt.c $(SRC)/bbt.h
	$(CC) -c $(SRC)/bbt.c

lparallelmethod_bbt.o: $(SRC)/lparallelmethod_bbt.c $(SRC)/bbt.h
	$(CC) -c $(SRC)/lparallelmethod_bbt.c

main.o: $(SRC)/main.F90 
	$(FC) -c $(SRC)/main.F90

parkind1.o: $(SRC)/parkind1.F90 
	$(FC) -c $(SRC)/parkind1.F90

sparallelmethod.o: $(SRC)/sparallelmethod.F90 xrd_unix_env.o
	$(FC) -c $(SRC)/sparallelmethod.F90

xrd_unix_env.o: $(SRC)/xrd_unix_env.F90 parkind1.o
	$(FC) -c $(SRC)/xrd_unix_env.F90

main.x: main.o parkind1.o sparallelmethod.o xrd_unix_env.o bbt.o lparallelmethod_bbt.o
	$(FC) -o main.x main.o parkind1.o sparallelmethod.o xrd_unix_env.o bbt.o lparallelmethod_bbt.o $(LIBS)


subclean:
	\rm -f main.o sparallelmethod.o

clean: 
	\rm -f *.o *.xml *.a *.x *.mod *.optrpt *.lst *.ok

tidy:
	\rm -f *.xml *.optrpt
