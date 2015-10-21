package diningPhilosophers;

public class Philosopher implements Runnable {
	//FIELDS
	private TableMonitor table;
	private int tablePosition;
	
	
	//METHODS
	// -PRIVATE
	private void meditating()
	{
		try
		{
			System.out.println(tablePosition+" is meditating...");
			Thread.sleep(((int)Math.random()*999999));
		} 
		catch (InterruptedException e) 
		{
			e.printStackTrace();
		}
	}
	
	private void eating()
	{
		try
		{
			System.out.println(tablePosition+" is eating...");
			Thread.sleep(((int)Math.random()*999999));
			System.out.println(tablePosition+" stops eating!");
		}
		catch (InterruptedException e) 
		{
			e.printStackTrace();
		}
	}
	
	// -PUBLIC
	public Philosopher(final TableMonitor table, final int tablePosition)
	{
		this.table= table;
		this.tablePosition= tablePosition;
	}
	
	@Override
	public void run() {
		while(true)
		{
			this.meditating();
			table.lockFork(tablePosition);
			this.eating();
			table.releaseFork(tablePosition);
		}
	}
	
}
