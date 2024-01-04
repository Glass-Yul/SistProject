package day0104;

public class CarEx {

	public static void main(String[] args) {
		Car car = new Car();
		
		car.run1(); // 1, 2
		car.run2(); // 3
		
		car.run3(new Tire() {
			@Override
			public void roll() {
				System.out.println("익명 객체 Tire 객체4가 굴러갑니다."); // 4
			}
		});

	}

}
