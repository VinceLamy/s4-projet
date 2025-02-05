


# Compilateur et options
CC = gcc
CFLAGS = -Wall -Wextra -Ilib -g

# Cibles
main : main.o game.o player.o map.o entity.o sprite.o coordonate.o cell.o settings.o
	$(CC) -o main main.o game.o player.o map.o entity.o sprite.o coordonate.o cell.o settings.o

main.o : src/main.c lib/main.h lib/game.h lib/includeLib.h
	$(CC) $(CFLAGS) -c src/main.c

game.o : src/game.c lib/game.h lib/player.h lib/map.h lib/includeLib.h
	$(CC) $(CFLAGS) -c src/game.c

player.o : src/player.c lib/player.h lib/entity.h lib/includeLib.h
	$(CC) $(CFLAGS) -c src/player.c

map.o : src/map.c lib/map.h lib/cell.h lib/includeLib.h
	$(CC) $(CFLAGS) -c src/map.c

entity.o : src/entity.c lib/entity.h lib/sprite.h lib/includeLib.h
	$(CC) $(CFLAGS) -c src/entity.c

sprite.o : src/sprite.c lib/sprite.h lib/coordonate.h lib/includeLib.h
	$(CC) $(CFLAGS) -c src/sprite.c

coordonate.o : src/coordonate.c lib/coordonate.h lib/includeLib.h
	$(CC) $(CFLAGS) -c src/coordonate.c

cell.o : src/cell.c lib/cell.h lib/includeLib.h
	$(CC) $(CFLAGS) -c src/cell.c

settings.o : src/settings.c lib/settings.h
	$(CC) $(CFLAGS) -c src/settings.c

lib/includeLib.h : lib/settings.h lib/util.h
	touch lib/includeLib.h

# Cible de nettoyage
clean:
	rm -f *.o main