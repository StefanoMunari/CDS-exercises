package sleepingBarber;

import java.util.concurrent.Semaphore;

class Customer extends Thread{
	private int id = -1;
	private Semaphore customers;
	private Semaphore barberService;
	private Semaphore accessShop;
	
	private void getMyHaircut()
	{
		try 
		{
			System.out.println("The customer "+id+" is ready...");
			Thread.sleep(((long) Math.random())*5000);
		} 
		catch (InterruptedException e)
		{
			e.printStackTrace();
		}
	}
	
	public Customer(final int id,Semaphore customers,Semaphore accessShop ,Semaphore barberService)
	{
		this.id=id;
		this.customers = customers;
		this.accessShop = accessShop;
		this.barberService = barberService;
	}

	@Override
	public void run() 
	{
		try {
			accessShop.acquire();
/*			if(barberService.getQueueLength() == BarberShop.MAX_SEATS)
				System.out.println("The customer "+id+" leaves the Barber's Shop!!!");
			else
			{*/
				System.out.println("The customer "+id+" enters in the Barber's Shop...");
				barberService.acquire(); //queue for barber service
				accessShop.release(); // entered in the shop, we don't need anymore the mutex on shop
				this.getMyHaircut(); //ready for haircut
				customers.release(); //wakes the barber
				System.out.println("Now the customer "+id+" is a real bald man.");
		//	}
		}
		catch (InterruptedException e) 
		{
			e.printStackTrace();
		}
	}
		
}

