package first.second;

public class loop {

	public static void main(String[] args) {
		System.out.println("Triangle1");
		for(int i=0; i<10; i++) {
			for(int j=0; j<10; j++) {
				if(i>=j) System.out.print("*");
				else System.out.print(" ");
			}
			System.out.println();
		}
		System.out.println();
		System.out.println("Triangle2");
		for(int i=9; i>=0; i--) {
			for(int j=0; j<10; j++) {
				if(i>=j) System.out.print("*");
				else System.out.print(" ");
			}
			System.out.println();
		}
		System.out.println();
		System.out.println("X");
		for(int i=0; i<10; i++) {
			for(int j=0; j<10; j++) {
				if(i==j || i+j==9) System.out.print("*");
				else System.out.print(" ");
			}
			System.out.println();
		}
		
		System.out.println();
		System.out.println("diamond");
		for(int i=0; i<10; i++) {
			for(int j=0; j<10; j++) {
				if(i<5) {
					if(j+i==4||j-i==5) System.out.print("*");
					else System.out.print(" ");
				}
				else {
					if(i-j==5||j+i==14) System.out.print("*");
					else System.out.print(" ");					
				}
			}
			System.out.println();
		}
		
		

	}

}

