/**
 * @author Stefano Munari <stefanomunari.sm@gmail.com>
 *
 * @class producerConsumer.Consumer
 * @classdesc thread class: shared buffer is the only field.
 * inside an infinite loop it calls inserisci
 * to insert an int into the buffer
 * @see producerConsumer.Monitor
 */
package producerConsumer;

import java.util.Random;

public class Producer implements Runnable{

	private Monitor monitor;

	public Producer(Monitor monitor){
		this.monitor=monitor;
	}

	@Override
	public void run() {
		try
		{
			while(true)
			{
				monitor.inserisci(1);
				Thread.sleep((new Random()).nextInt(100 + 1));
			}
		}
		catch (InterruptedException e)
		{
			e.printStackTrace();
		}
	}

}
