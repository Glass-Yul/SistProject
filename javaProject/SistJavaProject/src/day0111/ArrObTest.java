package day0111;


class Student1{
	private String name;
	private String hp;
	private int score;
	
	public Student1(String name, String hp, int score) {
		super();
		this.name = name;
		this.hp = hp;
		this.score = score;
	}
	public void writeData() {
		System.out.println("이름 : "+name);
		System.out.println("전화번호 : "+hp);
		System.out.println("점수 : "+score);
	}
	
}
public class ArrObTest {

	public static void main(String[] args) {
		Student1[] stu = new Student1[3];
		
		stu[0] = new Student1("이민호", "010-111-111", 88);
		stu[1] = new Student1("이영자", "010-222-222", 44);
		stu[2] = new Student1("김민정", "010-333-333", 77);
		
		Student1[] stu2 = {new Student1("이민호", "010-111-111", 88),
							new Student1("이영자", "010-222-222", 44),
							new Student1("김민정", "010-333-333", 77)};

		for(int i=0;i<stu2.length;i++) {
//			Student1 s = stu2[i];
			stu[i].writeData();
			System.out.println("------------------------------");
		}
		
		
		
	}
	
}
