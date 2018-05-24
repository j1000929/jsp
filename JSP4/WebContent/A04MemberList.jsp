<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="Model.MemberBean" %>
<%@page import="Model.MemberDAO" %>
<%@page import="java.util.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  1. MEMBER 태이블에서 모든 회원정보를 조회 -->
<%
	MemberDAO mdao = new MemberDAO();
	
	Vector<MemberBean> vec = mdao.SelectAllMember();
	
%>
<!-- 2. table태그를 이용하여 모든 회원 정보를 화면에 출력(아이디, 이메일, 전화, 취미만 출력 -->
	<h1>회원 정보</h1>
	<table>
		<thead>
			<th>아이디</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>취미</th>
	 </thead>
			<tbody>
			<%
					for(int i=0;i<vec.size();i++){
						MemberBean mbean = vec.get(i);	
			%>
			<tr>
				<td><%=mbean.getId() %></td>
				<td><%=mbean.getEmail()%></td>
				<td><%=mbean.getTel() %></td>
				<td><%=mbean.getHobby() %></td>
			</tr>
			<%
					}
			%>
			</tbody>
		
	</table>
</body>
</html>