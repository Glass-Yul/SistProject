package day0109;

import java.util.Scanner;

public class Quiz1 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int age1=0, age2=0, age=0, num;
	
		while(true) {
			System.out.println("나이? ");
			num = sc.nextInt();
			if(num==0) break;
			if(num>=50) age1++;
			else if(num>=30 && num <50) age2++;
			else age++;
		}
		System.out.println("50세 : "+age1);
		System.out.println("30세 : "+age2);
		System.out.println("그 외 : "+age);
	}

}
