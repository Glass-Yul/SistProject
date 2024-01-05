package day0105;

import java.util.Calendar;
import java.util.Scanner;

import day0104.Calculator;

public class QuizMyAgeInOut {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Calendar c = Calendar.getInstance();
		
		System.out.print("당신의 이름은? ");
		String name = sc.next();
		System.out.print("당신이 태어난 연도는? ");
		int year = sc.nextInt();
		System.out.print("당신이 사는 지역은? ");
		String local = sc.next();
		
		System.out.println("===============================");
		System.out.println("[" + name +"님의 개인정보]");
		System.out.println("===============================");
		System.out.println("이름 : "+name);
		System.out.println("태어난 연도 : "+year);
		System.out.println("나이 : "+ (c.get(c.YEAR) - year));
		System.out.println("지역 : "+local);
	}

}
