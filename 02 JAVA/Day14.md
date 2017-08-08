# Java

## Day14

1. 입출력

<hr/>

## 1. 입출력

### file/writer 클래스

```java
public static void main(String[] args) throws IOException {
    File file=new File("storage/data2.txt"); //파일로 출력
    Writer writer=new FileWriter(file); 
		
    StringBuilder str=new StringBuilder(); //문자열을 만드는 기능
    str.append("동해물과 백두산이 마르고 닳도록\n");
    str.append("하느님이 보우하사 우리나라만세\n");
    str.append("무궁화 삼천리 화려강산\n");
    str.append("대한사람 대한으로 길이 보전하세\n");
		
    writer.write(str.toString()); //문자열로 변환 후 출력
    writer.close();
}
```