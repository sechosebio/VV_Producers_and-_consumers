
#Model checking
##Producers and consumers
###Introduction
In this exercise we will play with a classical example of concurrency problem: producers and consumers. We have two kind of processes:
producer: it executes an infinite loop producing items and writing them into a buffer

```
while true begin
  <produce new item>
  <write into buffer> // critical section
end 
```
consumer: it is another infinite loop that extracts items from the buffer and processes (or consumes) them

```
while true begin
  <extract item from buffer> // critical section
  <consume item>
end
```
We will try the example with several values for P>=0 producers and C>=0 consumers. The buffer has a limited size of N>0 items. Typically, the buffer is handled as a circular FIFO. In our case, however, we will not represent the buffer itself, as we are not interested in simulation, but only on the correctness of the concurrent protocol itself. The code for writing an item in the buffer can be just a simple printf representing that situation, and the same happens for extracting an item from the buffer. The same happens for producing or consuming items: they can be represented as printf's.

Synchronization

The pseudocode above does not represent the waiting conditions: a producer cannot write when the buffer is full whereas a consumer cannot read when the buffer is empty. Besides, we should avoid that two processes may access the buffer simultaneously. In other words, writing items or extracting them from the buffer constitutes a critical section for which mutual exclusion should be guaranteed.
Goals

The goal of this exercise is playing with the example in SPIN and verifying three main conditions. We will try at least two possible algorithms, checking in each case the following properties:
absence of deadlock: we cannot reach a state in which all processes get blocked waiting for something to happen.
mutual exclusion: there cannot be two processes trying to access their critical sections "simultaneously", that is, they cannot both point to their corresponding buffer access as the next executable instruction.
absence of starvation (liveness): we must guarantee that no producer or consumer will starve. That is, any producer should be able to produce infinite items and any consumer should be able to consume infinite items. Note that if either P=0 or C=0 this may not hold.
Note also that absence of deadlock does not imply absence of starvation: perhaps one producer and one consumer work all the time, while others get waiting forever. 

####Algorithm 1 (naive)

The first solution is a naive protocol where we keep one shared variable items with the number of items in the buffer. Each producer would simply wait until items<N before writing whereas each consumer would wait until items>0 before consuming. Encode this solution in Promela and check its correctness. We should find a counterexample where a deadlock is reached. Print the counterexample trace using "spin -t -p ..." and add a textual or graphical explanation of what has happened. Try with different values for the number of producers and consumers or for the buffer size.

####Algorithm 2 (classical solution using semaphores)

In the second algorithm, we will use two general semaphores: items (counting the items in the buffer) and holes (counting the remaining holes in the buffer) plus a binary semaphor mutex for accessing the critical section. The pseudocodes for producers and consumers would now look like: 

##### Producer
```
while true begin
  <produce new item>;
  p(holes);
  p(mutex);
  <write into buffer> // critical section
  v(mutex);
  v(items)
end
```
#####Consumer
```
while true begin
  p(items);
  p(mutex);
  <extract from buffer> // critical section
  v(mutex);
  v(holes);
  <consume item>
end
```



