package sleepingBarber;

import java.util.concurrent.Semaphore;

class BarberShop {
	private static int CUSTOMER_ID = 0;
	public static final int MAX_SEATS = 2;
	
	private static void createCustomers(Semaphore customers,Semaphore accessShop ,Semaphore barberService)
	{
		try 
		{
			while(true)// creates new Customers
			{
				new Customer(CUSTOMER_ID, customers, accessShop, barberService).start();
				CUSTOMER_ID++;
				Thread.sleep((long) (Math.random()*100));
			} 
		}
		catch (InterruptedException e) 
		{
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		
		System.out.println("**********************************");
		System.out.println("**** THE SLEEPING BARBER SHOP ****");
		System.out.println("**********************************");
		
		final Semaphore customers = new Semaphore(0);
		final Semaphore accessShop = new Semaphore(1);
		final Semaphore barberService = new Semaphore(MAX_SEATS,true);
		//initializing Semaphore to True guarantees fairness for queues
		//for Mutex we don't need a FIFO policy because there will be at most one process queued
		
		new Barber(customers, barberService).start();
		
		createCustomers(customers, accessShop, barberService);
	}

}
