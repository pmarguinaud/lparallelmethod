include Makefile.inc

SRC=.

all: main.x

./sparallelmethod.intfb.ok: $(SRC)/./sparallelmethod.intfb.h 
	touch ./sparallelmethod.intfb.ok

main.o: $(SRC)/main.F90 
	$(FC) -c $(SRC)/main.F90

parkind1.o: $(SRC)/parkind1.F90 
	$(FC) -c $(SRC)/parkind1.F90

sparallelmethod.o: $(SRC)/sparallelmethod.F90 xrd_unix_env.o
	$(FC) -c $(SRC)/sparallelmethod.F90

xrd_unix_env.o: $(SRC)/xrd_unix_env.F90 parkind1.o
	$(FC) -c $(SRC)/xrd_unix_env.F90

main.x: main.o parkind1.o sparallelmethod.o xrd_unix_env.o 
	$(FC) -o main.x main.o parkind1.o sparallelmethod.o xrd_unix_env.o $(LIBS)


subclean:
	\rm -f main.o sparallelmethod.o

clean: 
	\rm -f *.o *.xml *.a *.x *.mod *.optrpt *.lst *.ok

tidy:
	\rm -f *.xml *.optrpt
