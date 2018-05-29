<%@page import="Model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert</title>
<style>
	body {
		font-family: "돋움", "굴림";
	}
	
	table {
		width: 500px;
		margin: 0 auto;
	}
	
	table, tr, th, td {
		border: 1px solid black;
	}
	
	.mainName {
		padding: 10px;
	}
	
	.subName {
		width: 150px;
		padding: 5px;
		text-align: center;
	}
	
	.control {
		width: 350px;
	}
	
	.end {
		padding: 5px;
		text-align: center;
	}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		
		MemberDAO dao = new MemberDAO();
		
		
		MemberBean bean = dao.selectMember(id);
	%>
	<%=bean.getId() %>
	<table border="1">
		<thead>
			<tr>
				<th colspan="2">회원 정보 상세</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>아이디</th>
				<td><%=bean.getId() %></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><%=bean.getEmail() %></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><%=bean.getTel() %></td>
			</tr>
			<tr>
				<th>취미</th>
				<td><%=bean.getHobby() %></td>
			</tr>
			<tr>
				<th>직업</th>
				<td><%=bean.getJob() %></td>
			</tr>
			<tr>
				<th>연령</th>
				<td><%=bean.getAge() %></td>
			</tr>
			<tr>
				<th>자기소개</th>
				<td><%=bean.getInfo() %></td>
			</tr>
		</tbody>
		<tfoot>
			<td colspan="2" class="end">
				<button type="button" onclick="location.href='A04MemberList.jsp'">전체 보기</button>
				<button type="button" onclick="location.href='A01MemberJoin.jsp'">회원정보 입력</button>
				<button type="button" onclick="location.href='A06MemberUpdateForm.jsp?id=<%=bean.getId()%>'">회원정보 수정</button>
				<button onclick="location.href='A08MemberDeleteForm.jsp?id=<%=bean.getId() %>'" >회원정보 삭제</button>
			</td>
		</tfoot>
	</table>
</body>
</html>