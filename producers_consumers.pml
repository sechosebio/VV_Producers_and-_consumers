/*
Algorithm 1 (naive)

The first solution is a naive protocol where we keep one shared variable items with the number of items in the buffer. Each producer would simply wait until items<N before writing whereas each consumer would wait until items>0 before consuming. Encode this solution in Promela and check its correctness. We should find a counterexample where a deadlock is reached. Print the counterexample trace using "spin -t -p ..." and add a textual or graphical explanation of what has happened. Try with different values for the number of producers and consumers or for the buffer size.*/

byte buffer = 0;

active proctype Producer(){
	do
	::	if 
		::	buffer < 255 ->
				printf("Produce nuevo elemento\n");
				buffer++;
				printf("%d Elementos en buffer\n\n",buffer);
		fi;
	od;
}

active proctype Consumer(){
	do
	::	if 
		::	buffer > 0 ->
				printf("Extraído elemento del buffer\n");
				buffer--;
				printf("%d Elementos en buffer\n\n",buffer);
		fi;
	od;
}
