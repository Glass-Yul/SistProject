package day0104;

public class DataType {

	public static void main(String[] args) {
		String name = args[0];
		String addr = args[1];  
		int age = Integer.parseInt(args[2]);
		int java = Integer.parseInt(args[3]);
		int oracle = Integer.parseInt(args[4]);
		
		System.out.println("학생명 : "+name);
		System.out.println("지역 : "+addr);
		System.out.println("나이 : "+age);
		System.out.println("======================");
		System.out.printf("%s님의 자바 점수는 %d점, 오라클 점수는 %d점 총 %d점 입니다.\n",name, java, oracle, java+oracle);
		

	}

}
