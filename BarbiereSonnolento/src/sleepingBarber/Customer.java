package sleepingBarber;

import java.util.concurrent.Semaphore;
import java.util.concurrent.atomic.AtomicInteger;

class Customer extends Thread{
	private int id = -1;
	private Semaphore customers;
	private Semaphore barberService;
	private Semaphore accessShop;
	private AtomicInteger barberServiceQueue = null;
	
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
	
	public Customer(final int id,Semaphore customers,Semaphore accessShop ,Semaphore barberService, AtomicInteger barberServiceQueue)
	{
		this.id=id;
		this.customers = customers;
		this.accessShop = accessShop;
		this.barberService = barberService;
		this.barberServiceQueue = barberServiceQueue; // counts the number of customers in barberService queue
	}

	@Override
	public void run() 
	{
		try {
			accessShop.acquire();
			if(barberServiceQueue.get() == BarberShop.MAX_SEATS)
			{
				System.out.println("The customer "+id+" leaves the Barber's Shop!!!");
				accessShop.release();
			}
			else
			{
				System.out.println("The customer "+id+" enters in the Barber's Shop...");
				barberServiceQueue.incrementAndGet();// counts the number of customers in barberService's queue
				accessShop.release(); // entered in the shop, we don't need anymore the mutex on shop
				barberService.acquire(); // queue for barber service has max of MAX_SEATS customers
				accessShop.acquire(); // mutex for R/W on barberServiceQueue variable
				barberServiceQueue.decrementAndGet(); // -1 on the waiting queue of barberService
				accessShop.release();
				this.getMyHaircut(); // ready for haircut
				customers.release(); // wakes the barber
				System.out.println("Now the customer "+id+" is a real bald man.");
			}
		}
		catch (InterruptedException e) 
		{
			e.printStackTrace();
		}
	}
		
}

