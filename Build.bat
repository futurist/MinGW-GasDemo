set PATH=%PATH%;E:\MinGW\bin;E:\MinGW\msys\1.0\bin

windres Rsrc.rc Rsrc.o
as -o Dlgbox.o Dlgbox.asm
ld -e _start -subsystem windows -o Dlgbox.exe Dlgbox.o Rsrc.o -lkernel32 -luser32 -s
