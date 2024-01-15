package day0115;

import java.util.List;
import java.util.Scanner;
import java.util.Vector;

public class VectorBorad {
	
	static List<Board_01> boards = new Vector<>();
	
	// 입력
	public static void inputDate() {
		Scanner sc = new Scanner(System.in);
		String writer, subject, content;
		
		System.out.println("작성자 : ");
		writer = sc.next();
		sc.nextLine();
		System.out.println("제목 : ");
		subject = sc.nextLine();
		sc.next();
		System.out.println("내용 : ");
		content = sc.nextLine();
		
		Board_01 board = new Board_01(writer, subject, content);
		boards.add(board);
		
		System.out.println("현재 데이터 갯수 : "+boards.size());
	}
	
	// 출력
	public static void outputDate() {
//		Scanner sc = new Scanner(System.in);
		String writer, subject, content;
		
		Board_01 board;
		
		for(int i=0;i<boards.size();i++) {
			board = boards.get(i);
			System.out.println("작성자 : "+board.getWriter());
			System.out.println("제목 : "+board.getSubject());
			System.out.println("내용 : "+board.getContent());
			System.out.println("---------------");
		}
		
	}
	
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		int num;
		
		while(true) {
			System.out.println("==선택 하시오.==");
			System.out.println("1. 입력");
			System.out.println("2. 출력");
			System.out.println("0. 종료");
			
			num = sc.nextInt();
			
			if(num==0) break;
			else if(num==1) inputDate();
			else if(num==2) outputDate();
			else System.out.println("제대로 입력하시오.");
			
		}
		
	}

}
