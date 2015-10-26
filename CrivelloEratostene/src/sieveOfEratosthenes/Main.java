package sieveOfEratosthenes;

import java.util.Scanner;

/* BREVE DESCRIZIONE:
 * Odd si preoccupa di creare la lista di numeri da processare e di creare il primo Sieve (Thread).
 * Ogni Sieve si sincronizza con gli altri Sieve tramite uno SharedBuffer, o Canale condiviso, in cui vengono inseriti
 * ed estratti i diversi numeri da processare.
 * Quando viene trovato un numero primo valido questo viene segnato in un array di booleani t.c. alla posizione
 * n-sima corrisponde il numero primo n.
 * Infine ogni Thread esegue una join sul "figlio", o thread-successore creato, in modo tale da ritornare
 * al main (che esegue anch'esso una join) una volta completato il proprio lavoro.
 * Quando tutti i thread sono terminati (eccetto il main) è possibile stampare il risultato, ovvero tutti i numeri
 * primi < nmax.
 */

class Main {

	public static void main(String[] args) throws InterruptedException
	{
		Scanner scan = new Scanner (System.in);

		System.out.println("Inserire un intero >=3");
		final int nmax= scan.nextInt();//legge l'input dell'utente
		scan.close();

		if(nmax >= 3)
		{
			boolean [] result= new boolean[nmax];
			Thread odd=new Thread(new Odd(result));

			odd.start();
			odd.join();//attende la terminazione di odd

			for(int i=0; i< nmax; i++)
				if(result[i]==true)
					System.out.println(i);
		}
		else
			System.err.println("Intero non valido!");
	}

}
