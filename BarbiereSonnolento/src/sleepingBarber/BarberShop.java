/**
 * @class sleepingBarber.BarberShop
 * @author Stefano Munari <stefanomunari.sm@gmail.com>
 * @classdesc Main class: creates static costants, instantiates semaphores (with FIFO priority), instatiates the barber and an infinite
 * number of customers.
 */
package sleepingBarber;

import java.util.concurrent.Semaphore;
import java.util.concurrent.atomic.AtomicInteger;

class BarberShop {
	private static int CUSTOMER_ID = 0;
	public static final int MAX_SEATS = 5;
	
	private static void createCustomers(Semaphore customers,Semaphore accessShop ,Semaphore barberService, AtomicInteger barberServiceQueue)
	{
		try 
		{
			while(true)// creates new Customers
			{
				new Customer(CUSTOMER_ID, customers, accessShop, barberService, barberServiceQueue).start();
				CUSTOMER_ID++;
				Thread.sleep((long) (Math.random()*1000));
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
		
		final Semaphore customers = new Semaphore(0); // initially busy
		final Semaphore accessShop = new Semaphore(1); // initially free
		final Semaphore barberService = new Semaphore(MAX_SEATS,true);
		final AtomicInteger barberServiceQueue = new AtomicInteger(0);
		//initializing Semaphore to True guarantees fairness for queues
		//for mutex we don't need a FIFO policy because there will be at most one process queued
		
		new Barber(customers, barberService).start();
		
		createCustomers(customers, accessShop, barberService, barberServiceQueue);
	}

}
