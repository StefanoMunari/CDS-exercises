package diningPhilosophers;

class Main {
	private static final int NPHILOSHOPERS=5;

	public static void main(String[] args) {
		TableMonitor table= new TableMonitor(NPHILOSHOPERS);
		for(int i=0; i < NPHILOSHOPERS; i++)
			new Thread(new Philosopher(table,i)).start();
	}

}
