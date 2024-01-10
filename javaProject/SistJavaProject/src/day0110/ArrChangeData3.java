package day0110;

public class ArrChangeData3 {

	public static void main(String[] args) {
		int[] lotto = new int[6];
		
		for(int i=0;i<lotto.length;i++) {
			lotto[i] = (int)(Math.random()*45)+1;
			for(int j=0;j<i;j++) {
				if(lotto[i]==lotto[j]) {
					i--;
					break; // i++ 로 가서 중복된 곳에서 다시 난수 생성
				}
			}
		}
		System.out.println("lotto 번호");
		for(int n:lotto)
			System.out.print(n+" ");
		System.out.println();
		
		System.out.println("오름정렬");
		for(int i=0;i<lotto.length-1;i++) {
			for(int j=i+1;j<lotto.length;j++) {
				if(lotto[i]>lotto[j]) {
					int tamp = lotto[j];
					lotto[j] = lotto[i];
					lotto[i] = tamp;
				}
			}
		}
		
		for(int n:lotto)
			System.out.print(n+" ");
		System.out.println();
	
	}

}
