<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//한글깨짐 방지(post방식)
request.setCharacterEncoding("utf-8");

%>
<!-- 1.사용자가 입력한 회원정보를 MemberBean에 셋팅 -->
<jsp:useBean id="mbean"  class="Model.MemberBean">
	<jsp:setProperty name="mbean" property="*"/>
</jsp:useBean>

<%
	/*2.취미(hobby)처리 */
	String [] hobby = request.getParameterValues("hobby");
	String texthobby="";
	
	for(int i =0;i<hobby.length;i++){
		texthobby+=hobby[i]+" ";
		
	}
	mbean.setHobby(texthobby);
	/*3.오라클에 접속*/
	String id="scott";
	String pass="tiger";
	String url="jdbc:oracle:thin:@localhost:1521:XE";//오라클 접속 경로
	
	try{
		//3-1.오라클 데이터베이스 사용 선언(오라클 드라이버 로드)
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		//3-2.오라클에 접속
		Connection con = DriverManager.getConnection(url, id, pass);//DriverManager은 static->객체 생성없이 사용
		
		//3-3.쿼리 준비(PreparedStatement객체 사용)
		String sql = "insert into 	MEMBER values  (?,?,?,?,?,?,?,?)";
		//PreparedStatement 객체는 쿼리문을 String으로 인식해서 해킹방지에 유리하다. 
		PreparedStatement pstmt=con.prepareStatement(sql);
		
		//3-4.쿼리에서 "?"의 순서에 맞게 데어터 매핑
				pstmt.setString(1, mbean.getId());
				pstmt.setString(2, mbean.getPass1());
				pstmt.setString(3, mbean.getEmail());
				pstmt.setString(4, mbean.getTel());
				pstmt.setString(5, mbean.getHobby());
				pstmt.setString(6, mbean.getJob());
				pstmt.setString(7, mbean.getAge());
				pstmt.setString(8, mbean.getInfo());
				
		//3-5. 쿼리실행
	
			pstmt.executeUpdate();//insert, update, delete 시 사용하는 메서드
		//3-6. 자원 반납
		con.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
<!-- 출력 테스트 -->
<h3>id: <%=mbean.getId() %></h3>
<h3>Hobby:<%=mbean.getHobby() %></h3>
<h1>오라클에 insert완료</h1>
</body>
</html>