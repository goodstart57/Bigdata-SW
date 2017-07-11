# JAVA

자바(영어: Java, 문화어: 쟈바)는 썬 마이크로시스템즈의 제임스 고슬링(James Gosling)과 다른 연구원들이 개발한 객체 지향적 프로그래밍 언어이다.

1991년 그린 프로젝트(Green Project)라는 이름으로 시작

1995년에 발표

처음에는 가전제품 내에 탑재해 동작하는 프로그램을 위해 개발했지만

현재 웹 애플리케이션 개발에 가장 많이 사용하는 언어 가운데 하나이고

모바일 기기용 소프트웨어 개발에도 널리 사용하고 있다.

(출처 : [위키피디아](https://ko.wikipedia.org/wiki/%EC%9E%90%EB%B0%94_(%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D_%EC%96%B8%EC%96%B4)))

<hr/>

## 1. 용어

  + 클래스(Class) : 객체를 만들어 내는 틀
  + 객체(Object)  : 클래스를 통해 만들어 낸 구현물
  + 메소드(Method) : 객체가 할 수 있는 일(함수)
  + 속성, 멤버변수, 필드 : 객체의 특성
  + 생성자 : 객체를 만들때 정의할 수 있는 메소드

<br>

## 2. 코드에서 보는 용어
```java
package kr.ac.hufs; //패키지 : 일종의 디렉토리

public class ClassTest {

	public static void main(String[] args) { // 메인문은 하나만 올 수 있다.
                //생성자를 이용한 A 클래스에서 hufs 객체 생성
		A hufs = new A(); 
		//hufs객체의 메소드 호출
		hufs.showMsgA();
		hufs.m2();
		hufs.showMsgA();
		
		A hufs2 = new A();
		hufs2.showMsgA();
	}

}

//클래스 A 정의 
class A{
	int a=100;
	String str="한국외국어대학교";
	
	A(){
		System.out.println("A() 생성자 호출");
	}
	void m1() {
		System.out.println("m1() 호출");
	}
	void m2() {
		a+=1;
	}
	void showMsgA() {
		System.out.println("a = " + a);
	}
}
```
