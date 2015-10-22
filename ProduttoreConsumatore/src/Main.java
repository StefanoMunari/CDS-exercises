package producerConsumer;

public class Main {

	public static void main(String[] args) {
		Monitor m= new Monitor();

		// VERSIONE CON 1 PRODUTTORE ED 1 CONSUMATORE
		new Thread(new Consumer(m)).start();
		new Thread(new Producer(m)).start();

		// VERSIONE CON N PRODUTTORI E CONSUMATORI
		final int n= 9;
		for(int i=0; i< n; i++)
		{
			new Thread(new Consumer(m)).start();
			new Thread(new Producer(m)).start();
		}

	}

}
