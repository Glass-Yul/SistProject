package day0104;

public class WorkThread extends Thread{

	public boolean work = true;
	
	public WorkThread(String name) {
		setName(name); // 스레드 이름
	}
	
	@Override
	public void run() {
		while(true) {
			if(work)
				System.out.println(getName() + " : 작업처리");
			else
				Thread.yield();
		}
	}
	
}
