package first.second;

import java.util.Scanner;

public class SissorTest {
	public static void main(String[] args) {
		RSP game = new RSP();
		game.Game();
	}
}

class RSP{
	//0:바위, 1:가위, 2:보
	int com=-1;
	int me=-1;
		
	void Game() {
		System.out.println("Rock Sissor Paper!");
		Scanner scan = new Scanner(System.in);
		
		do {
		System.out.println("Input 0 (Rock), 1 (Sissor), 2 (Paper)");
		this.me=scan.nextInt();
		} while(this.me>2 || this.me<0);
		
		scan.close();
		switch(this.me) {
		case 0: System.out.println("You : Rock"); break;
		case 1: System.out.println("You : Sissor"); break;
		case 2: System.out.println("You : Paper"); break;
		}
		
		this.com=(int)(Math.random()*10)%3;
		switch(this.com) {
		case 0: System.out.println("Com : Rock"); break;
		case 1: System.out.println("Com : Sissor"); break;
		case 2: System.out.println("Com : Paper"); break;
		}
		
		
		switch(com-me){
		case 0: System.out.println("draw!"); break;
		case -1: case 2: System.out.println("You lose ToT"); break;
		case 1: case -2: System.out.println("You win LOL"); break;
		}
	}
	
}

