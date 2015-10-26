package sieveOfEratosthenes;

class Sieve implements Runnable 
{
	private int prime;
	private SharedBuffer input;
	private SharedBuffer output;
	private boolean [] result;//array che contiene "true" alla posizione n-sima se "n" è un numero primo valido
	private boolean lastThread;
	private Thread next;
	
	public Sieve(int prime, SharedBuffer input, boolean [] result) 
	{
		this.prime=prime;
		this.input= input;
		this.lastThread=true;//è l'ultimo thread al momento della sua creazione
		this.result= result;
	}
	public void run()
	{
		while(true)
		{
			int number=input.get();//legge dall'input
			if(number == -1)//sentinella -> ha finito
			{
				if(!lastThread)//se non è l'ultimo thread -> reinserisce la sentinella per l'ultimo thread
				{
					output.put(-1);
					try {
						next.join();//attende la terminazione del "figlio"/thread successore
					} 
					catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
				break;//una volta finito il proprio lavoro termina uscendo dal ciclo altrimenti infinito
			}
			else
			{
				if(number%prime!=0)//potrebbe essere un primo valido
				{
					if(lastThread)//se è l'ultimo thread creato
					{
						result[number]=true;//è un primo valido
						output=new SharedBuffer();
						next=new Thread(new Sieve(number,output, result));
						next.start();
						lastThread=false;//non è più l'ultimo thread in esecuzione dopo aver eseguito il suo successore
					}
					else
						output.put(number);/*
											* lo inserisco nel buffer/canale di input per il prossimo thread.
											* 
											* i.e. 35 potrebbe essere processato prima dal Sieve(3) che lo considererebbe
											* erroneamente un primo. Se Sieve(3) sa di aver creato Sieve(5) come 
											* successore allora inserisce 35(un possibile primo per Sieve(3)) nel Buffer/Canale
											* di input di Sieve(5) in modo che quest'ultimo possa scartarlo 
											* (non essendo 35 un primo ma bensì un multiplo di 5)
											* 
											*/
				}
			}
		}
	}
}
