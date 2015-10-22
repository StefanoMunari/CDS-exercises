package producerConsumer;

public class Monitor {
	private int cont=0;
	private final int MAX=9;

	private void blocca()
	{
		try {
			wait();
		}
		catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	public synchronized void inserisci(int prod)
	{
		if(cont == MAX)
			blocca();
		cont= cont+1;//inserisce nel contenitore
		System.out.println("P*** "+cont+" ***");
		if(cont == 1)
			notifyAll();
	}

	public synchronized int preleva()
	{
		int prod;
		if(cont == 0)
			blocca();
		prod=cont;//preleva dal contenitore
		cont= cont-1;
		System.out.println("C*** "+cont+" ***");
		if(cont== MAX-1)
			notifyAll();
		return prod;
	}

}
