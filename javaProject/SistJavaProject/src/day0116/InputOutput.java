/*
 * package day0116;
 * 
 * import java.io.FileWriter; import java.io.IOException; import
 * java.util.Scanner;
 * 
 * public class InputOutput {
 * 
 * public static void main(String[] args) throws IOException { FileWriter output
 * = new FileWriter("D:/JAVA_Workspace/test.txt"); Scanner sc = new
 * Scanner(System.in);
 * 
 * 
 * String[] name = new String[]{"바나나", "포도", "아보카도", "토마토", "오렌지"}; int[] num =
 * new int[] {10, 20, 30, 15, 12}; int[] price = new int[] {2000, 15000, 3500,
 * 8000, 4000};
 * 
 * output.write("번호\t과일명\t수량\t단가\t총금액\t"); for(int i=0;i<name.length;i++) {
 * 
 * output.write("\n"+(i+1)+"\t"+name[i]+"\t"+num[i]+"\t"+price[i]+"\t"+(num[i]*
 * price[i]));
 * 
 * }
 * 
 * output.close(); }
 * 
 * }
 */

package day0116;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class InputOutput {

    public static void main(String[] args) {
        String[] name = new String[]{"바나나", "포도", "아보카도", "토마토", "오렌지"};
        int[] num = new int[]{10, 20, 30, 15, 12};
        int[] price = new int[]{2000, 15000, 3500, 8000, 4000};

        try (BufferedWriter output = new BufferedWriter(new FileWriter("D:/JAVA_Workspace/test.txt"))) {
            String header = "번호\t과일명\t수량\t단가\t총금액\t";
            output.write(header);

            for (int i = 0; i < name.length; i++) {
                String line = "\n" + (i + 1) + "\t" + name[i] + "\t" + num[i] + "\t" + price[i] + "\t" + (num[i] * price[i]);
                output.write(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
