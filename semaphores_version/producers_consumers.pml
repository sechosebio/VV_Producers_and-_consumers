/* In the second algorithm, we will use two general semaphores: items (counting
 * the items in the buffer) and holes(counting the remaining holes in the
 * buffer) plus a binary semaphore mutexfor accessing the critical section. */
#define N 255
byte holes = N;
byte items = 0;
bool mutex = false;

active [1] proctype Producer(){
	do
	::
		printf("Produce nuevo item\n");
		/* wait holes */
		atomic{
			holes;
			items<N;
			holes--;
		};
		/* wait mutex */
		atomic{
			!mutex;
			mutex = true;
		};
		cs:printf("Escribe en el buffer\n");
		/* signal mutex */
		mutex = false;
		/* signal items */
		items++;
		
	od;
}

active [0] proctype Consumer(){
	do
	::
		/* lock items */
		atomic{
			items;
			holes<N;
			items--;
		};
		/* lock mutex */
		atomic{
			!mutex;
			mutex = true;
		};
		cs:printf("Extrae elemento del buffer\n");
		/* signal mutex */
		mutex = false;
		/*signal holes */
		holes++;
		printf("Consume elemento\n");
	od;
}
