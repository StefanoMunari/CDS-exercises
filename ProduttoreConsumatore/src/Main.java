/**
 * @author Stefano Munari <stefanomunari.sm@gmail.com>
 *
 * @class producerConsumer.Main
 * @classdesc Entry point of the program, instantiates the monitor and the
 * threads related to the Producer objects and the Consumer objects.
 */
package producerConsumer;

class Main {

	public static void main(String[] args) {
		Monitor m= new Monitor();

// VERSION WITH 1 PRODUCER AND 1 CONSUMER
/*
		new Thread(new Consumer(m)).start();
		new Thread(new Producer(m)).start();
*/
// VERSION WITH N PRODUCERS AND N CONSUMERS
		final int n= 9;
		for(int i=0; i< n; i++)
		{
			new Thread(new Consumer(m)).start();
			new Thread(new Producer(m)).start();
		}

	}

}
