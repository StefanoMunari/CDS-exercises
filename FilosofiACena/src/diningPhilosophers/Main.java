/**
 * @author Stefano Munari <stefanomunari.sm@gmail.com>
 *
 * @class diningPhilosophers.Main
 * @classdesc Entry point of the program, instantiates the monitor wtih the number,
 * then creates and starts the philosophers instances passing the monitor as shared object.
 */
package diningPhilosophers;

class Main {
	private static final int NPHILOSHOPERS=5;

	public static void main(String[] args) {
		TableMonitor table= new TableMonitor(NPHILOSHOPERS);
		for(int i=0; i < NPHILOSHOPERS; i++)
			new Thread(new Philosopher(table,i)).start();
	}

}
