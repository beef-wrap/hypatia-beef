copy hypatia\hypatia.h hypatia\hypatia.c
clang -c -g -gcodeview -o hypatia.lib -target x86_64-pc-windows -fuse-ld=llvm-lib -Wall -DHYPATIA_IMPLEMENTATION hypatia\hypatia.c
mkdir libs
move hypatia.lib libs
