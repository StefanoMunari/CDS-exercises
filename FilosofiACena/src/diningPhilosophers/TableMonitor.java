package diningPhilosophers;

public class TableMonitor {
	//FIELDS
	private boolean[] lockedFork;
	
	//METHODS
	
	// - PRIVATE
	private int left(int i){
		return i;
	}
	
	private int right(int i){
		if(i+1 < lockedFork.length)
			return i+1;
		else
			return 0;
	}
	
	// - PUBLIC
	public TableMonitor(final int NForks){
		lockedFork = new boolean[NForks];
 		for(int i=0; i< NForks; i++)
			lockedFork[i]= false;
	}
	
	// -- SYNCHRONIZED
	public synchronized void lockFork(final int tablePosition){
		while(lockedFork[left(tablePosition)] || lockedFork[right(tablePosition)])
			try {
				wait();//RELEASE THE LOCK, PHILOSOPHER ADDED TO TableMonitor WAITING QUEUE
					  /*
					   * FROM JAVA DOCUMENTATION (Object.wait()):
					   * Causes the current thread to wait until 
					   * another thread invokes the notify() method 
					   * or the notifyAll() method for this object.
					   * This method should only be called by a thread that 
					   * is the owner of this object's monitor.
					   */
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		lockedFork[left(tablePosition)]= true;
		lockedFork[right(tablePosition)]= true;
	}
	
	public synchronized void releaseFork(final int tablePosition){
		lockedFork[left(tablePosition)]= false;
		lockedFork[right(tablePosition)]= false;
		notifyAll();//WAKES UP ALL THE WAITING THREADS, ALL WAITING THREADS ARE CONTENDING FOR THE OBJECT'S LOCK
	}
}
