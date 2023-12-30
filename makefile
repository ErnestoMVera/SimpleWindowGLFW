CXX=g++
CC=gcc
SRC_DIR=src
CXXFLAGS=-Wall -g $(shell pkg-config --cflags glfw3) -I./include
PKG_CMD=$(shell pkg-config --static --libs glfw3)
window: main.o glad.o
	$(CXX) $(CXXFLAGS) -o window glad.o main.o $(PKG_CMD)
main.o: $(SRC_DIR)/main.cpp
	$(CXX) $(CXXFLAGS) -c $(SRC_DIR)/main.cpp
glad.o: $(SRC_DIR)/glad.c
	$(CC) $(CXXFLAGS) -c $(SRC_DIR)/glad.c
clean:
	rm -rf window *.o
