package day0105;

import java.util.Scanner;

public class Quiz5 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("이름을 입력하시오 ");
		String name = sc.next();
		System.out.println("국, 영, 수 점수를 이벼력하시오 ");
		int n1 = sc.nextInt();
		int n2 = sc.nextInt();
		int n3 = sc.nextInt();
		int sum = n1+n2+n3;
		float avg = sum/3;
		System.out.println("=====================");
		System.out.println("총점 : "+sum);
		System.out.println("평균 : "+avg);
		String result = avg>=90 ? "참 잘함!" : avg>=80 && avg<90 ? "좀 더 노력하세요" : "불합격";
		System.out.println("평가 : "+result);

	}

}
