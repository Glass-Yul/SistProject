package day0105;

import java.util.Scanner;

public class QuizIf {

	public static void main(String[] args) {
		// 

		Scanner sc = new Scanner(System.in);
		
		System.out.print("당신이 좋아는 숫자는? ");
		int num = sc.nextInt();
		if(num%2 == 0)
			System.out.println("해당 숫자는 짝수 입니다.");
		else
			System.out.println("해당 숫자는 홀수 입니다.");
		
	}

}
