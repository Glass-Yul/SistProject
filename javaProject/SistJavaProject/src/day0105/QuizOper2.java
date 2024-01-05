package day0105;

import java.util.Scanner;

public class QuizOper2 {

	public static void main(String[] args) {
		// 이름, 키, 몸무게 입력
		// 표준 몸무게 출력
		
		Scanner sc = new Scanner(System.in);
		System.out.print("당신의 이름? ");
		String name = sc.next();
		System.out.print("키? ");
		int n1 = sc.nextInt();
		System.out.print("몸무게? ");
		int n2 = sc.nextInt();
		System.out.println("=======================");
		System.out.printf("%s님의 권장 몸무게는 %.1fkg 입니다.", name, (n1-100)*0.9);
		

	}

}
