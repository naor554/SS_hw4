CC=gcc
FLAGS=-Wall -g

all: graph

libgraphAlgo.a: algo.o nodes.o edges.o
	$(AR) -rcs libgraphAlgo.a algo.o nodes.o edges.o

nodes.o: nodes.c algo.h
	$(CC) $(FLAGS) -c nodes.c
edges.o: edges.c algo.h
	$(CC) $(FLAGS) -c edges.c
algo.o: algo.c algo.h
	$(CC) $(FLAGS) -c algo.c
main.o: main.c algo.h
	$(CC) $(FLAGS) -c main.c

graph: main.o libgraphAlgo.a
	$(CC) $(FLAGS) -o graph main.o libgraphAlgo.a


.PHONY: clean all

clean:
	rm -f *.o *.a graph
