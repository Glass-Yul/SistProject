package day0105;

import java.util.Scanner;

public class QuizOper {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("받은 알바비 입력 : ");
		int money = sc.nextInt();
		
		int n1 = money/10000;
		money-=n1*10000;
		int n2 = money/1000;
		money-=n2*1000;
		int n3 = money/100;
		money-=n3*100;
		int n4 = money/10;
		money-=n4*10;
		int n5 = money/1;
		System.out.println("만원 : "+n1);
		System.out.println("천원 : "+n2);
		//System.out.println((money%10000)/1000); 도 가능
		System.out.println("백원 : "+n3);
		System.out.println("십원 : "+n4);
		System.out.println("일원 : "+n5);

	}

}
