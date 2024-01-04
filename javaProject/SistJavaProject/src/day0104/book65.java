package day0104;

import java.util.Scanner;

public class book65 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("상품명 : ");
		String name = sc.next();
		System.out.print("수량 : ");
		int num = sc.nextInt();
		System.out.print("단가 : ");
		int money = sc.nextInt();
		System.out.println("총 금액 : " + num*money + "원");
		

	}

}
