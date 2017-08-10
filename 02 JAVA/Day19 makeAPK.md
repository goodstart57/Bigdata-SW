### Day19
# JAVA(Android Studio를 이용한 채팅 앱 개발)

1. Android Studio를 이용하여 apk파일 제작
    - project 생성

2. Bluestack을 이용하여 테스트

<hr/>

<br>

> ## Android Studio를 이용하여 APK파일 생성 후<br>BlueStack을 이용해 테스트합니다.

<br>

## 1. Android Studio를 이용하여 apk파일 제작

- res-layout-new-layout resource file으로 mylayout.xml 생성, MainActivity에서 layout파일 변경

```java
public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.my_layout);        
    }
}
```


