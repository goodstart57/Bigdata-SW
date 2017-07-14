# JAVA

## Day05

1. 배열
2. 배열을 이용한 오늘의 메뉴 정하기

<hr/>

## 1. 배열
배열 : 자료형들의 집합, 2차원 이상의 배열도 가능하다


+ 배열의 선언<br>
int arr[] = new int[5];<br>
int[] arr = new int[5];

+ 배열을 선언과 동시에 초기화<br>
int arr[5] ={1,2,3,4,5};<br>
int[5] = {1,2,3,4,5};

+ 배열의 길이<br>
arr.length

+ 배열 출력 방법

```java
  //1 for 구문
  System.out.print("arr[] \t: ");
  for(int i=0; i<5; i++) {
    System.out.print(arr[i] + " ");
  }
  System.out.println();

  //2 for-each 구문
  System.out.print("arr[2] \t: ");
  for(int j : arr2) {
    System.out.print(j + " ");
  }
  System.out.println();

  //3 배열의 길이를 모를때 효과적으로 사용
  System.out.print("arr[2] \t: ");
  int length=arr2.length;
  for(int i=0; i<length; i++) {
    System.out.print(arr2[i] + " ");
  }
```
+ 하나의 문자열을 구분자를 사용하여 문자 배열로 나눠서 저장하기
```java
  //Code
  String str="설현/나라/조승우/장나라";
  String[] arrStr=str.split("/");
  for(String j : arrStr) {
    System.out.print(j + " ");
  }

  //Output
  설현 나라 조승우 장나라 
```

+ String 변수는 참조형(refrence) 변수이다.<br>
그래서 str의 주소를 참조하는 str2의 변수를 수정하면 str도 같이 변한다.
```java
  //Code
  String[] str= {"설현", "헬로비너스 나라", "조승우", "장나라"};
  String[] str2 = str; //str2는 str의 주소를 참조한다!
  for(String j : str) {
    System.out.print(j + " ");
  }
  System.out.println();
  str2[1] = "권나라";
  for(String j: str) {
    System.out.print(j + " ");
  }

  //Output
  설현 헬로비너스 나라 조승우 장나라 
  설현 권나라 조승우 장나라 
```

<br>
<br>

## 2. 배열을 이용한 오늘의 메뉴 정하기

```java
package first.second.project;

public class ArrayTest2 {

	public static void main(String[] args) {
		Indecisiveness lol = new Indecisiveness();
		lol.solve();

	}

}

class Indecisiveness{
	private String[] menu= 	{"한식", "중식", "일식", "양식"};
	private String[] mko= 	{"김치찌개", "삼겹살", "제육볶음", "된장찌개", "오므라이스"};
	private String[] mCh=	{"짜장면", "짬뽕", "볶음밥", "우동", "깐쇼새우"};
	private String[] mJp=	{"스시", "야끼우동", "다꼬야끼", "라멘", "샤브샤브"};
	private String[] mWe=	{"돈까스", "피자", "파스타", "리조또", "피쉬앤칩스"};
	
	void solve() {
		int smenu=(int)(Math.random()*10)%4;
		int spick=(int)(Math.random()*10)%5;
		
		System.out.println("한식, 중식, 일식, 양식 중 ["+menu[smenu]+"]");
		if(smenu==0) {
			switch(spick) {
				case 0: System.out.println("오늘의 메뉴는 "+mko[spick]); break;
				case 1: System.out.println("오늘의 메뉴는 "+mko[spick]); break;
				case 2: System.out.println("오늘의 메뉴는 "+mko[spick]); break;
				case 3: System.out.println("오늘의 메뉴는 "+mko[spick]); break;
				default: System.out.println("먹지마그냥");
			}
		}
		else if(smenu==1) {
			switch(spick) {
				case 0: System.out.println("오늘의 메뉴는 "+mCh[spick]); break;
				case 1: System.out.println("오늘의 메뉴는 "+mCh[spick]); break;
				case 2: System.out.println("오늘의 메뉴는 "+mCh[spick]); break;
				case 3: System.out.println("오늘의 메뉴는 "+mCh[spick]); break;
				default: System.out.println("먹지마그냥");
			}
		}
		else if(smenu==1) {
			switch(spick) {
				case 0: System.out.println("오늘의 메뉴는 "+mJp[spick]); break;
				case 1: System.out.println("오늘의 메뉴는 "+mJp[spick]); break;
				case 2: System.out.println("오늘의 메뉴는 "+mJp[spick]); break;
				case 3: System.out.println("오늘의 메뉴는 "+mJp[spick]); break;
				default: System.out.println("먹지마그냥");
			}
		}
		else {
			switch(spick) {
				case 0: System.out.println("오늘의 메뉴는 "+mWe[spick]); break;
				case 1: System.out.println("오늘의 메뉴는 "+mWe[spick]); break;
				case 2: System.out.println("오늘의 메뉴는 "+mWe[spick]); break;
				case 3: System.out.println("오늘의 메뉴는 "+mWe[spick]); break;
				default: System.out.println("먹지마그냥");
			}
		}
		
	}
	
	
}
```