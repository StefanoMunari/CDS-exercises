/**
 * @author Stefano Munari <stefanomunari.sm@gmail.com>
 *
 * @class sleepingBarber.Barber
 * @classdesc Implements the Barber's behaviour: wait on customer mutex, when
 * the semaphore is released the barber release the barberService semaphore so the customer
 * in the barberService's queue can be served.
 * be served
 * @see sleepingBarber.Customer
 */
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
			Thread.sleep(3000);
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
