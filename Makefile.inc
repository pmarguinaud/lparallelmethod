FC=pgf90 -mp -fPIC -Minfo -gopt -Mlarge_arrays -Mlist -traceback -Mnofma -Mbyteswapio -Mbackslash -Mstack_arrays -cuda -acc=gpu -O2 -gopt -gpu=cc70,cc80 -Minfo=accel,all,ccff
CC=pgcc -I. -g -O0
