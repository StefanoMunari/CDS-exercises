package sleepingBarber;

import java.util.concurrent.Semaphore;

class Barber extends Thread {
	private Semaphore customers = null; 
	private Semaphore barberService = null;
	
	private void cut()
	{
		try 
		{
			System.out.println("The barber is working...");
			Thread.sleep(9999);
		} 
		catch (InterruptedException e)
		{
			e.printStackTrace();
		}
	}

	public Barber(Semaphore customers, Semaphore barberService)
	{
		this.customers = customers;
		this.barberService = barberService;
	}
	
	@Override
	public void run() {
		try
		{
			while(true) 
			{
				customers.acquire();
				barberService.release();
				this.cut();
			} 
		}
		catch (InterruptedException e) 
		{
			e.printStackTrace();
		}
	}
	
}
