package day0105;

import java.util.Scanner;

public class Quiz4 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		System.out.print("이름 입력 : ");
		String name = sc.next();
		System.out.print("자바 시험점수 입력 : ");
		int num = sc.nextInt();
		String result;
		
		if(num>=90)
			result = "매우잘함";
		else if(num>=80 && num<90)
			result = "잘함";
		else if(num>=70 && num<80)
			result = "좀 더 노력할 것";
		else 
			result = "재수강 ㅋ";
		
		System.out.println("======================");
		System.out.printf("%s님의 시험 결과는 %s 입니다.\n", name, result);
		System.out.println("======삼항연산자 사용=======");
		result = num>=90 ? "매우잘함" : num>=80 && num<90 ? "잘함" : num>=70 && num<80 ? "좀 더 노력할 것" : "재수강임";
		
		System.out.println("최종 결과 : " + result);
		
		

	}

}
