CC = gcc
CFLAGS = -Wall -pedantic -Wextra -g
TARGET = transpoziceMaticeNaMiste

# Výchozí cíl (spustí se příkazem: make)
all: $(TARGET)

# Zkompiluje transpoziceMaticeNaMiste.c na binárku "transpoziceMaticeNaMiste"
$(TARGET): transpoziceMaticeNaMiste.c
	$(CC) $(CFLAGS) transpoziceMaticeNaMiste.c -o $(TARGET)

# Zkompiluje (pokud je potřeba) a spustí přes Valgrind (příkaz: make valgrind)
valgrind: $(TARGET)
	valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./$(TARGET)

# Smaže binárku (příkaz: make clean)
.PHONY: all valgrind clean
clean:
	rm -f $(TARGET)