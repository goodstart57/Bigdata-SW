# JAVA

## Day03

1. 클래스간 자원 공유
2. 조건문
3. String Class의 메소드
4. 연산자
5. 조건문과 논리연산자 응용

<hr/>

## 1. 클래스간 자원 공유
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

<br>
<br>

## 2. 조건문

```java
//Code
int c=d=1;
if(c==d){
	System.out.println("같아요");
}
else{
	System.out.println("달라요");
}

//Output
같아요
```

if문 안의 조건식이 참이면 if문을, 거짓이면 else문을 실행한다.

<br>
<br>

## 3. String Class의 메소드

equals : 문자열 자체를 비교한다.
```java
//Code
String s="Hello";
System.out.println(s.equals("Hello"));

//Output
true
```

indexOf, lastIndexOf : 0부터 시작한다는 것에 유의
```java
//Code
String s="Hello";
System.out.println(s.indexOf("o"));
System.out.println(s.indexOf("l"));
System.out.println(s.lastIndexOf("o"));

//Output
4
2
4
```

length : 문자열의 길이
```java
//Code
String s="Hello";
System.out.println(s.length());

//Output
5
```

replace : 대소문자를 구분하여 첫번째 arg를 두번쨰 arg로 바꿔준다.
```java
//Code
String s="Hello";
String Hh="Hehho";
System.out.println(s.replace('l', 'o'));
System.out.println(Hh.replace('h', 'o'));


//Output
Hehho
Hehho
```

split : 구분자를 기준으로 문장을 나눠서 배열에 저장한다.
```java
//Code
String str3="dog,cat,bear";
String[] nst=str3.split(",");
System.out.println(nst[0]);
System.out.println(nst[1]);
System.out.println(nst[2]);

//Output
dog
cat
bear
```

substring(n) : n번째 문자 이후 부터 출력<br>substring(a, b) : a번째 문자 이후부터 b번째 문자 까지 출력
```java
//Code
String s2="java.lang.Object";
System.out.println(s2.substring(10));
System.out.println(s2.substring(10,13));

//Output
Object
Obj
```


str.trim() : 문자열의 양옆 공백을 모두 지워준다
```java
//Code
String strT="          하이            ";
System.out.println(strT+"여백");
System.out.println(strT.trim()+"여백");

//Output
          하이            여백
하이여백

```

<br>
<br>

## 4. 연산자

산술연산자 : +=, -=, *=, /=, %=
```java
a+=10; 과 a=a+10;은 같다.
```

비교연산자 : ==(같다), !=(다르다), <, >, <=, >=

논리연산자 : &&, &, ||, |

조건연산자 : A? B:C

instanceof 연산자 : 객체가 클래스의 객체가 맞는지 확인

```java
//Code
Scanner scan = new Scanner(System.in);
scan instanceof Scanner

//Output
true
```

<br>
<br>

## 5. 응용
```java
Scanner scan = new Scanner(System.in);
System.out.print("신청 아이디: ");
String id=scan.nextLine();
id=id.trim();
scan.close();

if(id.equals("Git")||id.equals("GitHub")||id.equals("GitPages")){
	System.out.print("사용 할 수 없는 아이디 입니다.");
}
else{
	System.out.print("아이디 신청 완료했습니다.");
}
```
