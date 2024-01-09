package day0109;

import java.util.Scanner;

public class Quiz2 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int[] kor = new int[4];
		int[] eng = new int[4];
		int[] mat = new int[4];
		String[] name = {"홍수연", "김수연", "최수연", "민수연"};
		int[] total = new int[4];
		double[] avg = new double[4];
		int[] rank = new int[4];
		
		for(int i=0;i<4;i++) {
			System.out.println(name[i]+"학생 국/영/수 순으로 점수 입력");
			kor[i] = sc.nextInt();
			eng[i] = sc.nextInt();
			mat[i] = sc.nextInt();
			total[i] = kor[i]+eng[i]+mat[i];
			avg[i] = total[i]/3;
			rank[i] = 1;
			
		}
		System.out.println("=======================================");
		System.out.println("번호\t이름\t국어\t영어\t수학\t총점\t평균\t등수");
		System.out.println("=======================================");
		
		for(int i=0;i<4;i++) {
			for (int j = 0; j < 4; j++) {
		        if (avg[i] < avg[j]) {
		            rank[i]++;
		        }
		    }
			System.out.printf("%d\t%s\t%d\t%d\t%d\t%d\t%.2f\t%d\n", 
					i+1, name[i], kor[i], eng[i], mat[i], total[i], avg[i], rank[i]);
		}
	}

}
