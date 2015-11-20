/**
 * @author Stefano Munari <stefanomunari.sm@gmail.com>
 *
 * @class producerConsumer.Monitor
 * @classdesc encapsulates exclusive access at buffer resource
 * inside synchronized public methods inserisci and preleva
 * checking and then modifying the state of the buffer.
 */
package producerConsumer;

class Monitor {
	private int cont=0; // counter for buffer's state
	private final int MAX=9;// max buffer's size

	private void blocca()
	{
		try {
			wait();
		}
		catch (InterruptedException e)
		{
			e.printStackTrace();
		}
	}

	public synchronized void inserisci(int prod)
	{
		if(cont == MAX)
			blocca();
		cont= cont+1; // insert in the buffer
		System.out.println("P*** "+cont+" ***");
		if(cont == 1)
			notifyAll();
	}

	public synchronized int preleva()
	{
		int prod;
		if(cont == 0)
			blocca();
		prod=cont; // get from the buffer
		cont= cont-1;
		System.out.println("G*** "+cont+" ***");
		if(cont== MAX-1)
			notifyAll();
		return prod;
	}

}
