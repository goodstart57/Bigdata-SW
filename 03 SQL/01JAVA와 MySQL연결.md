### 01

# SQL 

# 1. JAVA에 mySQL연결해서 불러오기

coding
```java
public class MemberDAO {
	Connection con;
	Statement stmt;
	ResultSet rs;
	
	public MemberDAO() throws SQLException, ClassNotFoundException {
		//1. 드라이버 등록
		Class.forName("com.mysql.jdbc.Driver"); //드라이버명
		//2. 연결
		String url="jdbc:mysql://localhost:3306/test";
		String user="root";
		String password="mysql";
		con=DriverManager.getConnection(url, user, password);
		try {
			selectMember();
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void selectMember() throws Exception {
		//3. Statement 생성
		stmt=con.createStatement();
		//4. SQL 전송
		rs=stmt.executeQuery("select * from member");
		//5. 결과 얻기
		while(rs.next()) {
			int no=rs.getInt("no");
			String id=rs.getString("id");
			String pw=rs.getString("pw");
			String name=rs.getString("name");
			System.out.println(no+"\t:"+id+"\t:"+pw+"\t:"+name);
		}
		//6. 자원 종료
		stmt.close();
	}
	
	public void close() throws Exception {
		if(rs!=null) rs.close();
		if(stmt!=null) stmt.close();
		if(con!=null) con.close();
		
	}
}
```

output
```
1	:java	:big	:JaeHwa
2	:C	:small	:SeoJoon
3	:C++	:big	:Woori
4	:Python	:small	:HyoSung
```

DAO는 DB연동을 하는 클래스로, 한 클래스당 하나의 테이블만 연동한다.

java.sql.* 의 interface는 비어있으므로 만들어서 써야한다.<br>이것은 규격대로 만들어지기 때문에 Good
