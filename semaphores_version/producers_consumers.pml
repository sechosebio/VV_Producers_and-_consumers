/* In the second algorithm, we will use two general semaphores: items (counting
 * the items in the buffer) and holes(counting the remaining holes in the
 * buffer) plus a binary semaphore mutexfor accessing the critical section. */

byte holes = 255;
byte items = 0;
bool mutex = false;

active proctype Producer(){
	do
	::
		printf("Produce nuevo item\n");
		/* wait holes */
		holes;
		holes--;
		/* wait mutex */
		!mutex;
		mutex = true;
		cs:printf("Escribe en el buffer, hay %i elementos\n");
		holes--;
		/* signal mutex */
		mutex = false;
		/* signal items */
		items++;
		
	od;
}

active proctype Consumer(){
	do
	::
		/* lock items */
		items;
		items--;
		/* lock mutex */
		!mutex;
		mutex = true;
		cs:printf("Extrae elemento del buffer, quedan %i elementos\n");
		/* signal mutex */
		mutex = false;
		/*signal holes */
		holes--;
		printf("Consume elemento\n");
	od;
}
