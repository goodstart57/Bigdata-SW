# JAVA

## Day03

1. 클래스간 자원 공유

<hr/>

1. 클래스간 자원 공유
같은 패키지 내에 만들에진 클래스들은 변수, 함수 등을 공유 할 수 있다.

Member.java 소스파일에 정의된 Memeber Class

```java
package kr.ac;

public class Member {
	String name="";
	int birthYear=0;
	String nick="";
	String email="";
	String thumbnail="";
	
	void setAll(String _name, int _birthYear, String _nick, String _email, String _thumbnail) {
		this.name = _name;
//		this.birthYear=Integer.parseInt(_birthYear);
		this.birthYear=_birthYear;
		this.nick=_nick;
		this.email=_email;
		this.thumbnail=_thumbnail;
	}
	
	String getProfile() {
		String allProfile = "이름: " + this.name + "\n";
		allProfile = allProfile + "생년: " + this.birthYear;
		allProfile = allProfile + "애칭: " + this.nick + "\n";
		allProfile = allProfile + "이메일: " + this.email + "\n";
		allProfile = allProfile + "썸네일: " + this.thumbnail + "\n";
		
		return allProfile;
	}
}
```

<br>

다른 소스파일에서 Member Class 호출해서 사용
```java
package kr.ac;

import java.util.Scanner;

public class ClassTest {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		Member mem = new Member();
		
		System.out.print("이름: ");
		mem.name=scan.next();
		System.out.print("생년: ");
		mem.birthYear = scan.nextInt();
		System.out.print("애칭: ");
		mem.nick = scan.next();
		System.out.print("이메일: ");
		mem.email = scan.next();
		System.out.print("사진: ");
		mem.thumbnail = scan.next();
		System.out.println();
		
		scan.close();
		
		String profile = mem.getProfile();
		System.out.println(profile);
		
	}
}
```
