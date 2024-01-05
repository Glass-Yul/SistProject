package day0105;

import java.util.Scanner;

public class Quiz3 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int n1 = sc.nextInt();
		int n2 = sc.nextInt();
		int n3 = sc.nextInt();
		
		if(n1>n2) {
			if(n1>n3)
				System.out.println("n1이 제일 큼");
			else
				System.out.println("n3이 제일 큼");
		} else if (n2>n1) {
			if(n2>n3)
				System.out.println("n2이 제일 큼");
			else
				System.out.println("n3이 제일 큼");
		} else
			System.out.println("n3이 제일 큼");
		
		// 또는 int result = n1>n2 && n1>n3 ? n1 : n2>n1 && n2>n3 ? n2 : n3;
		System.out.println("=======삼항 연산자 사용=====");
		int result = n1>n2 && n1>n3 ? n1 : n2>n1 && n2>n3 ? n2 : n3;
		System.out.println("max값 : "+result);
		
	}
}
