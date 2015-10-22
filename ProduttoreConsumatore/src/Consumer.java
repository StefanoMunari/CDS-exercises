package producerConsumer;

import java.util.Random;

public class Consumer implements Runnable {

	private Monitor monitor;

	public Consumer(Monitor monitor){
		this.monitor=monitor;
	}

	@Override
	public void run() {
		try {
			Random r=null;
			while(true)
			{
				r=new Random();
				monitor.preleva();
				Thread.sleep(r.nextInt(100 + 1));
			}
		}
		catch (InterruptedException e)
		{
			e.printStackTrace();
		}
	}
}
