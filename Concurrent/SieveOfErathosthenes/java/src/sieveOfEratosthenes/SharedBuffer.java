package sieveOfEratosthenes;

class SharedBuffer{
	private int value;
	private boolean sent;

	public SharedBuffer(){
		sent=false;
	}

	public synchronized void put(final int value){
		while(sent)
		{
			try{
				wait();
			}
			catch (InterruptedException e)
			{
				e.printStackTrace();
			}
		}
		sent=true;
		this.value=value;
		notifyAll();
	}

	public synchronized int get(){
		while(!sent)
		{
			try {
				wait();
			}
			catch (InterruptedException e)
			{
				e.printStackTrace();
			}
		}
		sent=false;
		notifyAll();
		return this.value;
	}
}
