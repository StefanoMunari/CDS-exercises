/**
 * @author Stefano Munari <stefanomunari.sm@gmail.com>
 *
 * @class producerConsumer.Monitor
 * @classdesc encapsulates exclusive access at buffer resource
 * inside synchronized public methods put and get
 * checking and then modifying the state of the buffer.
 */
package producerConsumer;

class Monitor {
	private int counter= 0; // counter for buffer's state
	private final int MAX=9;// max buffer's size

	private void stop()
	{
		try {
			wait();
		}
		catch (InterruptedException e)
		{
			e.printStackTrace();
		}
	}
	
	public synchronized void put(int element)
	{
		while(counter == MAX)
			stop();
		counter++; // insert in the buffer
		System.out.println("PUT: BUFFER = "+counter+";");
		if(counter == 1)
			notifyAll();
	}

	public synchronized int get()
	{
		int element=0;
		while(counter == 0)
			stop();
		element= counter; // get from the buffer
		counter--;
		System.out.println("GET: BUFFER = "+counter+";");
		if(counter == MAX-1)
			notifyAll();
		return element;
	}
}