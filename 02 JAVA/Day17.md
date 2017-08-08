### Day 17
# 객체지향프로그래밍

1. 객체지향 프로그래밍이란?
    - 정의
    - 특징

<hr/>

## 1. 객체지향 프로그래밍(OOP)이란?
### OOP의 정의

<br>

### OOP의 3가지 특징
  1. 은닉화(Encapsulation)<br>
      - Access Modifier : private < (default) < protected < pulbic
    
  2. 상속(Inheritance)
  3. 다형성(polymorphishm)
      - polymorphic variable
      - overriding(재정의)
      - overloading

  ↓

상속과 Polymorphic variable으로 인해 성능 저하

서비스 클래스가 너무 많아서 확장성이 낮다.


## 2. AWT 패키지를 이용한 UI 디자인
AWT(Abstract Window ToolKit) Event : import java.awt.event.*;

1 EventSource에 EventListener를 달고

2 EventListener를 구현하는 EventHandler를 작성