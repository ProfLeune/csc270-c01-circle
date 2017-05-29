# Assigment 1: Write a program in C that computes the circumference
# and the radius of a circle with a given radius.
TARGET=circle
SRC=circle.c
CC=gcc
COPTS=-Wall
TESTS=tests/circle.test

all: $(TARGET)

clean: $(TARGET) $(TESTS)
	rm -f $^

test: $(TESTS)

tests/%.test: tests/%.test_in
	./$(TARGET) < $< > $@
	diff $@ $< > /dev/null || echo Test failed >&2

$(TARGET): $(SRC)
	$(CC) $(COPTS) -o $(TARGET) $(SRC)
