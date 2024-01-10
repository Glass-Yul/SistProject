package day0110;

public class ArrChangeData {

	public static void main(String[] args) {
		int[] arr = {4, 8, 9, 12, 34, 22, 53, 532, 43, 8};
		
		System.out.println("==========================");
		for(int i:arr)
			System.out.print(i+" ");

		System.out.println();
		System.out.println("=========================="); // 반 쪼개어 소트
		for(int i=0;i<arr.length/2;i++) {
			int tamp = arr[i];
			arr[i] = arr[arr.length-1-i];
			arr[arr.length-1-i] = tamp;
		}
		for(int i:arr)
			System.out.print(i+" ");
		System.out.println();
		
		System.out.println("============= 정렬 ============"); // 버블 소트
		int tamp;
		for(int i=0;i<arr.length-1;i++) {
			for(int j=i+1;j<arr.length;j++) {
				if(arr[i]>arr[j]) {
					tamp = arr[i];
					arr[i] = arr[j];
					arr[j] = tamp;
				}
			}
		}
		
		for(int i:arr)
			System.out.print(i+" ");
		System.out.println();
	
	}

}
