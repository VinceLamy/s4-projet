


# Compilateur et options
CC = gcc
CFLAGS = -Wall -Wextra -Ilib -g
LDFLAGS = -lncurses

# Cibles
main : main.o game.o player.o map.o entity.o sprite.o coordonate.o cell.o settings.o controller.o
	$(CC) $(CFLAGS) -o main main.o game.o player.o map.o entity.o sprite.o coordonate.o cell.o settings.o controller.o $(LDFLAGS)

main.o : src/main.c lib/main.h lib/game.h lib/includeLib.h lib/controller.h
	$(CC) $(CFLAGS) -c src/main.c $(LDFLAGS)

game.o : src/game.c lib/game.h lib/player.h lib/enemie.h lib/map.h lib/includeLib.h
	$(CC) $(CFLAGS) -c src/game.c $(LDFLAGS)

player.o : src/player.c lib/player.h lib/entity.h lib/cell.h lib/includeLib.h 
	$(CC) $(CFLAGS) -c src/player.c $(LDFLAGS)

enemie.o : src/enemie.c lib/enemie.h lib/entity.h lib/cell.h lib/includeLib.h 
	$(CC) $(CFLAGS) -c src/enemie.c $(LDFLAGS)

map.o : src/map.c lib/map.h lib/cell.h lib/includeLib.h
	$(CC) $(CFLAGS) -c src/map.c $(LDFLAGS)

entity.o : src/entity.c lib/entity.h lib/sprite.h lib/includeLib.h
	$(CC) $(CFLAGS) -c src/entity.c $(LDFLAGS)

sprite.o : src/sprite.c lib/sprite.h lib/coordonate.h lib/includeLib.h
	$(CC) $(CFLAGS) -c src/sprite.c $(LDFLAGS)

coordonate.o : src/coordonate.c lib/coordonate.h lib/includeLib.h
	$(CC) $(CFLAGS) -c src/coordonate.c $(LDFLAGS)

cell.o : src/cell.c lib/cell.h lib/includeLib.h
	$(CC) $(CFLAGS) -c src/cell.c $(LDFLAGS)

settings.o : src/settings.c lib/settings.h
	$(CC) $(CFLAGS) -c src/settings.c $(LDFLAGS)

controller.o : src/controller.c lib/controller.h
	$(CC) $(CFLAGS) -c src/controller.c $(LDFLAGS)

lib/includeLib.h : lib/settings.h lib/util.h
	touch lib/includeLib.

run:
	make clean
	./main

# Cible de nettoyage
clean:
	rm -f *.o