package day0105;

import java.util.Scanner;

public class Quiz6 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("상품명 : ");
		String name = sc.next();
		System.out.println("수량 : ");
		int num = sc.nextInt();
		System.out.println("가격 : ");
		int money = sc.nextInt();

		double result = num*money;
		System.out.println("=====================");

		if(num>=5) {
			result -= (num*money) * 0.1;
			System.out.println(result);
		} else
			System.out.println(result);

	}

}
