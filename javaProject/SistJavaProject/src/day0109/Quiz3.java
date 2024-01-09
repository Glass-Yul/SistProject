package day0109;

import java.util.Scanner;

public class Quiz3 {
	
	static Scanner sc = new Scanner(System.in);

	public static void main(String[] args) {
		
		System.out.println("quiz1");
		quiz1();
		System.out.println("quiz2");
		quiz2();
		System.out.println("quiz3");
		quiz3();

	}
	
	public static void quiz1() {
		// Q. 팩토리얼 구할 숫자 입력 후 해당 숫자에 대한 팩토리얼 구하기
		System.out.println("숫자 입력 : ");
		int num = sc.nextInt();
		int result=1;
		for(int i=1;i<=num;i++) 
			result *= i;
		System.out.println(num+"! 결과 : "+result);
	}
	public static void quiz2() {
		// Q. 두 수 x, y를 입력한 후 x의 y승을 for문을 이용해 구하기(x를 y 횟수 만큼 구함)
		System.out.println("x와 y를 순서대로 입력 : ");
		int x = sc.nextInt();
		int y = sc.nextInt();
		int result = x;
		for(int i=0;i<y;i++)
			result*=x;
		System.out.println(x+"의 "+y+"승 결과 : "+result);
	}
	public static void quiz3() {
		// Q. 1~100까지 숫자 중 짝수의 합과 홀수의 합을 출력
		int x=0, y=0;
		
		for(int i=1;i<=100;i++) {
			if(i%2==0)
				x+=i;
			else
				y+=i;
		}
		System.out.println("짝수 합 = "+x+" / 홀수 핪 = "+y);
	}

}
