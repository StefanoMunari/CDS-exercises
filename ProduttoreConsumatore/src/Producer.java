package producerConsumer;

import java.util.Random;

public class Producer implements Runnable{

	private Monitor monitor;

	public Producer(Monitor monitor){
		this.monitor=monitor;
	}

	@Override
	public void run() {
		Random r=null;
		try {
			while(true)
			{
				r=new Random();
				monitor.inserisci(1);
				Thread.sleep(r.nextInt(100 + 1));
			}
		}
		catch (InterruptedException e)
		{
			e.printStackTrace();
		}
	}

}
