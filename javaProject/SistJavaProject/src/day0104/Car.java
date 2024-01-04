package day0104;

public class Car {
	private Tire tire1 = new Tire();
	private Tire tire2 = new Tire() {
		@Override
		public void roll() {
			System.out.println("익명 자식 Tire 객체2이 굴러갑니다.");
		}
	};
	
	public void run1() {
		tire1.roll();
		tire2.roll();
	}
	
	public void run2() {
		Tire tire3 = new Tire() {
			@Override
			public void roll() {
				System.out.println("익명 자식 Tire 객체3이 굴러갑니다.");
			}
		};
		tire3.roll();
	}
	
	public void run3(Tire tire) {
		tire.roll();
	}
}
