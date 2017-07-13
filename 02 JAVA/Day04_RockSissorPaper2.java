package first.second;

import java.util.Scanner;

public class SissorTest2 {
	public static void main(String[] args) {
		RSP_verS rsp = new RSP_verS();
		rsp.StartRSP();
	}
}

class RSP_verS{
	String me="";
	String com="";
	
	String ComTries(){
		int RSP_try=(int)(Math.random()*10)%3;
		switch(RSP_try) {
			case 0: return "Rock";
			case 1: return "Sissor";
			default: return "Paper";
		}
	}
	
	void StartRSP() {
		Scanner scan= null;
		String again="Y";
		while(true) {
			//me
			
			while(true) {
				scan=new Scanner(System.in);
				System.out.print("Rock Sissor Paper!!! ");
				this.me=scan.next();
				if(this.me.equals("Rock")||this.me.equals("Sissor")||this.me.equals("Paper")) break;
				System.out.println("Enter Rock or Sissor or Paper exactly.");
			}
			
			System.out.println("me  : "+ me);
			//com
			this.com=ComTries();
			System.out.println("com : "+ this.com);
			int result= me.length() - com.length();
			
			switch(result){
				case 0: System.out.println("Res : draw!\n"); break;
				case -1: case 2: System.out.println("Res : You lose ToT\n"); break;
				case 1: case -2: System.out.println("Res : You win LOL\n"); break;	
			}
			System.out.print("Again?(Y/N) ");
			again=scan.next();
			
			if(again.equals("N")) {
				scan.close();
				return;
			}
		}
		
		
	}
}
