package sieveOfEratosthenes;

public class Odd implements Runnable{
	private int nmax;
	private boolean [] result;
	private SharedBuffer output=new SharedBuffer();//pensato come uno buffer/canale di output per Odd
	
	public Odd(boolean [] result)
	{
		this.nmax=result.length;
		this.result=result;
	}

	public void run() {
		Thread firstSieve= new Thread(new Sieve(2, output, result));
		
		firstSieve.start();
		
		for(int i=3; i< nmax;i=i+2)
			output.put(i);//scrive nel buffer/canale di output
		output.put(-1);//sentinella per Sieve
		
		try
		{
			firstSieve.join();//attende la terminazione di Sieve
		} 
		catch (InterruptedException e) {
			e.printStackTrace();
		}
		
	}

}
