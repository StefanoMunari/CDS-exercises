/** 
 * @author Stefano Munari <stefanomunari.sm@gmail.com>
 *
 * @class producerConsumer.Consumer
 * @classdesc thread class: shared buffer is the only field, calls get
 * to get an int from the buffer inside an infinite loop
 * @see producerConsumer.Monitor
 */
package producerConsumer;

import java.util.Random;

class Consumer implements Runnable {

	private Monitor monitor;

	public Consumer(Monitor monitor){
		this.monitor=monitor;
	}

	@Override
	public void run() {
		try
		{
			while(true)
			{
				monitor.get();
				Thread.sleep((new Random()).nextInt(100 + 1));
			}
		}
		catch (InterruptedException e)
		{
			e.printStackTrace();
		}
	}
}