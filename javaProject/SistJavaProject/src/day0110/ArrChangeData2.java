package day0110;

public class ArrChangeData2 {

	public static void main(String[] args) {
		String[] arr = {"최씨", "김씨", "양씨", "이씨", "서씨", "용씨", "구씨"};
		
		System.out.println("==========================");
		for(String i:arr)
			System.out.print(i+" ");
		System.out.println();
	
		
		System.out.println("============= 정렬 ============"); 
		String tamp;
		for(int i=0;i<arr.length-1;i++) {
			for(int j=i+1;j<arr.length;j++) {
				if(arr[i].compareTo(arr[j]) > 0) {
					tamp = arr[i];
					arr[i] = arr[j];
					arr[j] = tamp;
				}
			}
		}
		
		for(String i:arr)
			System.out.print(i+" ");
		System.out.println();
	
	}

}
